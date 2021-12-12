`define FUNCTIONAL
`define UNIT_DELAY #1
`include "primitves.v"
`include "sky130_hd.v"

module test_tb;
reg clk,s;
reg [3:0] x;
reg [3:0] y;
wire [3:0] r;

test1 uut(x, y, s, clk, r);

initial begin
$dumpfile("test_updated.vcd"); // vcd dump file
$dumpvars; // dump everything
end 

 initial begin 
	clk = 0;
    forever begin
    #5
    clk = ~clk;
        end 
 end

initial begin
x=4'd1;
y = 4'd1;
s=1'b1;
#10
if(r==4'd2)  
        $display("test correct");
else
         $display("test failed for input combination 11");
#10

x=4'd1;
y = 4'd3;
s=1'b1;
#10
if(r==4'd4)  
        $display("test correct");
else
         $display("test failed for input combination 00");
#10

x=4'd1;
y = 4'd2;
s=1'b0;
#10
if(r==4'd4)  
       $display("test correct");
else
        $display("test failed for input combination 10");
#10

x=4'd4;
y = 4'd3;
s=1'b0;
#10
if(r==4'd4)  
       $display("test correct");
else
        $display("test failed for input combination 01");

$finish;
end

endmodule
