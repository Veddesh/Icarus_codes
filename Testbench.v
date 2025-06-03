`timescale 1ns / 1ps


module Testbench ();
  reg Clock = 1'b0; 
  reg Reset;
  wire [3:0] Count;

  
  Mycounter I1(.CLK(Clock), .RST(Reset), .OUT(Count));

  initial begin
    $display("Starting
    #100 Reset = 1'b0; 
    #2000 Reset = 1'b1;
    #400 $finish;      
  end

 
  always #50 Clock = ~Clock;


  initial begin
    $dumpfile("count.vcd");
    $dumpvars(0, Testbench);
    $monitor("%d, %b, %b, %d", $time, Clock, Reset, Count);
  end
endmodule


