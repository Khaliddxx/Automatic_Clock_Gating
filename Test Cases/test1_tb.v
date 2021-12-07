module counter_tb;

reg clk;
wire[3:0] count;

counter my_counter( .clk(clk), .count( count ) );

initial
begin
    clk = 0;
    #200 $finish;

    
 $dumpfile("test1.vcd"); // vcd dump file
 $dumpvars; // dump everything

end

always
begin
    #2 clk = ~clk;
end

always @( posedge clk)
  $display("Count = %b", count );
endmodule
