module test2(input [7:0]D_IN, input clk,en, output reg [7:0]D_OUT);
integer i;
    always @(posedge clk)
    begin
        for(i=0;i<8;i=i+1)
        begin
            if(en)
                D_OUT[i]<= D_IN[i];
        end
    end
endmodule