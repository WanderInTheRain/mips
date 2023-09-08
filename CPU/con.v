`timescale 1ns / 1ps

module conc(
    input clk,
    input resetn,
    input [5:0] op,
    output reg t1,
    output reg t2,
    output reg t3,
    output reg t4,
    output reg t5,
    output reg s31,
    output reg s32,
    output reg rwe,
    output reg s51,
    output reg dwe,
    output reg jwe,
    output reg ju,
    output reg sf
);

reg [4:0] t;

always @(posedge clk) begin
    if (!resetn) begin
        t <= 5'b10000;
        t1<=1;
        t2<=0;
        t3<=0;
        t4<=0;
        t5<=0;
    end else begin
        t = {t[3:0],t[4]};
        t1=t[0];
        t2=t[1];
        t3=t[2];
        t4=t[3];
        t5=t[4];
    end
end

// 1.取指
//2.译码
//3.执行
always @(t2) begin 
        case (op) // 根据操作码进行分支选择
            6'b000101 : begin//条件跳转
                jwe=1;
                ju=0;
            end
            6'b000010 : begin
                jwe=1;
                ju=0;
            end
            default : begin
                jwe=0;
                ju=0;
            end
        endcase
end


always @(t3) begin 
        case (op) // 根据操作码进行分支选择
            6'b101011: begin // SW指令
                s31=0;
                s32=0;
                sf=0;
            end

            6'b100011: begin //LW指令
                s31=0;
                s32=0;
                sf=0;
            end

            6'b000000: begin // 运算指令 begin 
                s31=0;
                s32=1;
                sf=1;
            end// 加法指令

            6'b000101 : begin//条件跳转
                s31=1;
                s32=0;
                sf=0;
            end
            6'b000010 : begin
                s31=0;
                s32=1;
                sf=0;
            end
            6'b001000 : begin
                s31=0;
                s32=0;
                sf=0;
            end
        endcase
end


//4.访存
always @(posedge t4) begin 
     begin 
        case (op) // 根据操作码进行分支选择
            6'b101011: begin // SW指令
                dwe=1;
                end

            6'b100011: begin //LW指令
                dwe=0;
            end
            default : 
                dwe=0;
        endcase
    end 
end 

//5.写回
always @(posedge t5) begin 
    begin 
        case (op) // 根据操作码进行分支选择
            6'b100011: begin // LW指令
                s51=1;
                #1
                rwe=1;
                #4
                rwe=0;
            end

            6'b000000: begin // 运算指令 
            s51=0;
            #1
            rwe=1;
            #4
            rwe=0;
            end

            6'b001000: begin // 运算指令 
            s51=0;
            #1
            rwe=1;
            #4
            rwe=0;
            end

            default:begin 
            s51=0;
            #1
            rwe=0;
            end

        endcase
    end 
end 

endmodule