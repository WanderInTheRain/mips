`timescale 1ns / 1ps

module pcou(
    input t1,
    input rst,
    input [31:0] npc,
    output reg [31:0] pc
    );


always @(posedge t1)
    begin
        if(!rst)
            pc<=8'h00000000;
        else
            pc<=npc;
    end
endmodule

