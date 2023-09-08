`timescale 1ns / 1ps

module adda(
    input [31:0] pc,
    output reg [31:0] npc
);

    always @(pc)
        npc=pc+4;

endmodule