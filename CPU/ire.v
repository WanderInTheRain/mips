`timescale 1ns / 1ps

module ire(
    input [31:0] ir,
    output reg [4:0] ar,
    output reg [4:0] br,
    output reg [15:0] imm,
    output reg [5:0] op,
    output reg [4:0] rdr,
    output reg [25:0] ind
);

    always @(ir) begin
        op=ir[31:26];
        ar<=ir[25:21];
        br<=ir[20:16];
        imm<=ir[15:0];
        ind<=ir[25:0];
        if (op==6'b101011)
            rdr<=ir[20:16];
        else if (op==6'b100011)
            rdr<=ir[20:16];
        else if (op==6'b001000)
            rdr<=ir[20:16];
        else
            rdr<=ir[15:11];
    end

endmodule