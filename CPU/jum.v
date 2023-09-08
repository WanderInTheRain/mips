`timescale 1ns / 1ps

module jum(
    input t2,
    input [31:0] npc,
    input [25:0] ind,
    input ju,
    output  reg [31:0] npcn
    );
	always @ (t2)
	begin
        if (ju)
            npcn={npc[31:28],ind,2{0}};
        else
            npcn=npc;
    end
endmodule