module muxi(
    input [31:0] x,
    input [31:0] y,
    input s,
    output reg [31:0] z
);

always @* begin
    case (s)
        1'b1: z = x;
        1'b0: z = y;
    endcase
end

Endmodule