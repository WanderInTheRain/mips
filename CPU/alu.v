module alu (
    input t3,
    input [31:0] a,
    input [31:0] b,
    input [10:0] f,
    output reg [31:0] aluout
);

always @(a,b,f) begin 
            case (f)
                11'b00000100000: aluout <= a + b; // 加法指令
                11'b00000100010: aluout <= a - b; // 减法指令
                11'b00000100100: aluout <= a & b; // 与运算指令
                11'b00000100101: aluout <= a | b; // 或运算指令
                11'b00000100110: aluout <= a ^ b; // 异或指令
                11'b00000101010: aluout <= (a < b) ? 1 : 0; // 小于指令
                11'b00000001010: if (b == 0) #1 aluout <= a; // 条件移动指令
                default : begin 
                    if (f[5:0]==6'b000000) begin
                    aluout <= b <<f[10:6]; // 移位指令
                    end
                end
            endcase
    end

endmodule