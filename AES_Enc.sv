module AES_Enc(//input logic aes_en,
               input logic [127:0]state_in,key_in,
               input wire [3:0]round,
               output logic [127:0]state_out);
wire logic [127:0]C;
wire [127:0]B, B_shift;

Byte_sub bs(state_in, B);
shift_row sr(B, B_shift);
Mix_column mc(B_shift, C);
always_comb
/*begin
if(aes_en == 1)*/
begin
if(round < 4'b1010 & round > 4'b0000)
 state_out = C ^ key_in;
else if(round == 4'b1010)
 state_out = B_shift ^ key_in;
else state_out = state_in;
end
/*else
state_out = state_in;
end*/
endmodule
