module flipflop #(parameter WIDTH = 128)
               ( input logic clk, en, reset,
                 input logic [WIDTH-1:0]d,
                 output logic [WIDTH-1:0]q );

always_ff@(posedge clk or posedge en or posedge reset )
begin
if (reset)
q <= 0;
else if (en)
q <= d;
end
endmodule

