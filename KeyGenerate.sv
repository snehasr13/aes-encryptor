module keygenerate(in, round, out);
	
	input logic [127:0] in;
	input logic [3:0] round;
	output logic [127:0] out;
	
	reg [31:0] temp;
	reg [31:0] T;
	
	assign T[31:0] = in[31:0];
	
	G_func g1(T,round,temp);
	
	assign out[127:96] = in[127:96] ^ temp[31:0];
	assign out[95:64] = out[127:96] ^ in[95:64];
	assign out[63:32] = out[95:64] ^ in[63:32];
	assign out[31:0] = out[63:32] ^ in[31:0];
	
endmodule
