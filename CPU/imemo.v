`timescale 1ns / 1ps

`define IPATH "../../../../lab4.data/inst_data.txt"

module imemo(
    input [31:0] pc,
    output reg [31:0] ir
);
    reg [31:0] imem [21:0]; // 256个32位指令内存单元

    initial begin
        $readmemh(`IPATH , imem);
    end
    
    always @(pc)
        ir = imem[(pc>>2)];
        
endmodule