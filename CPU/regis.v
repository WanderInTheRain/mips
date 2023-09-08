`timescale 1ns / 1ps

module regis(
    input   t2,
    input   [4 :0] ar, 
    output  reg [31:0] a,  
    input   [4 :0] br, 
    output  reg [31:0] b,  
    input   rwe,
    input   [4 :0] wr, 
    input   [31:0] w
    );
    integer i = 0;
    reg [31:0] regs[31:0];
	initial begin
        for(i = 0;i < 32;i = i + 1) 
        regs[i]=0;
	    end
	always @ (posedge t2 or rwe)
	begin
	   if(rwe)
	       regs[wr] <= w;
	   else begin
	       a<=regs[ar];
	       b<=regs[br];
	   end
	end
    
endmodule