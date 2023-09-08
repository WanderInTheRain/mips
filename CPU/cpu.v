module cpu(
    input clk , // clock, 100MHz
    input resetn , // active low
    output [31:0] debug_wb_pc , // PC
    output debug_wb_rf_wen , // 写 使 能 信 号
    output [4 :0] debug_wb_rf_addr, //写 回 的 寄 存 器 编 号
    output [31:0] debug_wb_rf_wdata // 写 回 的 数 据
);

    wire [31:0] npcn,npc,pc, ir, a, b, imme,aluout, r;
    wire [4:0] ar, br,rdr;
    wire t1,t2, t3, t4;
    wire s31,s32,rwe,s41,s51,dwe,ju,jwe,sf;
    wire [31:0] d31,d32,d41,d51;
    wire [5:0] op;
    wire [15:0] imm;
    wire [10:0] fo;
    wire [25:0] ind;

    //assign四个信号
    assign debug_wb_pc=pc; // 正在执行的指令的程序计数器（PC）
    assign debug_wb_rf_wen=rwe; // 寄存器文件的写使能信号
    assign debug_wb_rf_addr=rdr; // 正在写入的寄存器编号
    assign debug_wb_rf_wdata=d51;

    conc my_con(
    .clk(clk),
    .resetn(resetn),
    .op(op),
    .t1(t1),
    .t2(t2),
    .t3(t3),
    .t4(t4),
    .t5(t5),
    .s31(s31),
    .s32(s32),
    .rwe(rwe),
    .s51(s51),
    .dwe(dwe),
    .jwe(jwe),
    .ju(ju),
    .sf(sf)
    );


    pcou my_pc(
    .t1(t1),
    .rst(resetn),
    .npc(d41),
    .pc(pc)
    );

    imemo my_imem(
        .pc(pc),
        .ir(ir)
    );

    ire my_ir(
        .ir(ir),
        .ar(ar),
        .br(br),
        .imm(imm),
        .op(op),
        .rdr(rdr),
        .ind(ind)
    );

    adda my_add(
        .pc(pc),
        .npc(npc)
    );

    
    jum my_jum(
    .t2(t2),
    .npc(npc),
    .ind(ind),
    .ju(ju),
    .npcn(npcn)
    );

    regis my_regs(//
        .t2(t2),
        .ar(ar), 
        .a(a),  
        .br(br), 
        .b(b),  
        .rwe(rwe),
        .wr(rdr), 
        .w(d51)
    );

    ex my_ex(
        .t2(t2),
        .imm(imm),
        .jwe(jwe),
        .imme(imme)
    );

    muxi mux31(
        .x(npc),
        .y(a),
        .s(s31),
        .z(d31)
    );

    muxi mux32(
        .x(b),
        .y(imme),
        .s(s32),
        .z(d32)
    );

    muxf muf(
        .f(imm[10:0]),
        .sf(sf),
        .fo(fo)
    );

    alu my_alu (
        .t3(t3),
        .a(d31),
        .b(d32),  
        .f(fo),
        .aluout(aluout)
    );

    jcond my_jcond(
    .t3(t3),
    .a(a),
    .b(b),
    .jwe(jwe),
    .s41(s41)
    );

    muxi mux41(
        .x(npcn),
        .y(aluout),
        .s(s41),
        .z(d41)
    );

    dmemo my_dmem(
    .t4(t4),
    .dwe(dwe),
    .rr(aluout),
    .r(r),
    .wr(aluout),
    .w(b)
    );

    muxi mux51(
        .x(r),
        .y(aluout),
        .s(s51),
        .z(d51)
    );

endmodule