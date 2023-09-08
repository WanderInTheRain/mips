`timescale 1ns / 1ps

`define DPATH "../../../../lab4.data/data_data.txt"

module dmemo(
    input t4,
    input  dwe,
    input   [31:0] rr, 
    output  reg [31:0] r,
    input   [31:0] wr, 
    input   [31:0] w
);
    reg [31:0] dmem [7:0]; // 256个32位内存单元

    initial begin
        $readmemh(`DPATH , dmem);
    end
    
	always @ (posedge t4)
	begin
	   if(dwe)
	       dmem[(wr>>2)] <= w;
	   else begin
	       r<=dmem[(rr>>2)];
	   end
	end
        
endmodule