`timescale 1ns / 1ps

module jcond(
    input t3,
    input jwe,
    input [31:0] a,
    input [31:0] b,
    output  reg s41
    );
	always @ (posedge t3)
	begin
        if (a!=b & jwe)
            s41=0;
        else
            s41=1;
    end
endmodule