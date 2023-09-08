module muxf(
    input [10:0] f,
    input sf,
    output reg [10:0] fo
);

always @* begin
    case (sf)
        1'b1: fo = f;
        1'b0: fo = 11'b00000100000;
    endcase
end

endmodule