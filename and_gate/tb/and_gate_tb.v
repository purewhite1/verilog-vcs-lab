module and_gate_tb;
  reg a, b;
  wire out;

  and_gate u_and_gate (
    .a(a),
    .b(b),
    .out(out)
  );

  initial begin
    $fsdbDumpfile("wave.fsdb");       // 加这个：保存 FSDB 波形
    $fsdbDumpvars(0, and_gate_tb);    // 加这个：记录整个模块
  end

  initial begin
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10;
    $finish;
  end
endmodule

