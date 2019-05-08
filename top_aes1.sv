module top_aes1(input logic clk, reset,
               input logic [127:0]plaintext,
               input logic [127:0]key,
               output logic [127:0]ciphertext);

 logic round_ctrl, aes_en = 0;
 logic aes_in_en, aes_out_en, key_exp_in_en, key_exp_out_en;
 logic  [127:0]A, state_out, state_in;
 logic  [127:0]key_in, key_out, key_input, state_input;
 logic [3:0]round;

assign state_input = aes_in_en ? state_in : A;
assign key_input = key_exp_in_en ? key_in : key;
assign A = plaintext ^ key;


always_ff@(posedge clk)
begin
if (reset)
begin
aes_en <= 0;
end
else
begin
aes_en <= 1;
end
end

control_fsm fsm(clk, reset, aes_en, round_ctrl, aes_in_en, aes_out_en, key_exp_in_en, key_exp_out_en);

//AES & KEY GENERATION
AES_Enc aes(state_input, key_out, round, state_out);
flipflop ff1(clk, aes_in_en&~round_ctrl, reset, state_out, state_in);
Key_gen kg(key_input, round, key_out);
flipflop ff2(clk, key_exp_in_en, reset, key_out, key_in);
flipflop #4 ff3(clk, aes_out_en, reset, round + 1, round);
round_check rc(round, round_ctrl);

// CIPHERTEXT (OUTPUT) AFTER ROUND 10
always_comb
begin
if(round_ctrl == 0)
ciphertext = 0;
else
ciphertext = state_in;
end

endmodule

