module multidimarraytest();
logic [3:0] myarray [2:0];
assign myarray[0] = 4'b0010;
assign myarray[1][3:2] = 2'b01;
assign myarray[1][1] = 1'b1;
assign myarray[1][0] = 1'b0;
assign myarray[2][3:0] = 4'hC;
initial begin
$display("myarray == %b", myarray);
$display("myarray[2:0] == %b", myarray[2:0]);
$display("myarray[1:0] == %b", myarray[1:0]);
$display("myarray[1] == %b", myarray[1]);
$display("myarray[1][2] == %b", myarray[1][2]);
$display("myarray[2][1:0] == %b", myarray[2][1:0]);
end
endmodule
