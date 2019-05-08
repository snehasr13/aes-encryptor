module Add_round_key(
                     input logic [127:0]state_in,
                     input logic [127:0]round_key,
                     output logic [127:0]state_out);

							
							
/*generate for(i = 0; i < 16; i = i+1)
begin: loop
assign state_out[((i+1)*8) - 1:(i*8)] = state_in[((i+1)*8) - 1:(i*8)] ^ round_key[((i+1)*8) - 1:(i*8)];
end
endgenerate*/
assign state_out[127:0] = state_in[127:0] ^ round_key[127:0];
endmodule
