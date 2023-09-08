`timescale 1ns / 1ps

module ex(
    input   t2,
    input   [15:0] imm,
    input   jwe,
    output  reg [31:0] imme
    );
	always @ (posedge t2)
	begin
        imme={{16{imm[15]}},imm[15:0]};
        if (jwe)
            imme=imme<<2;
    end
endmodule