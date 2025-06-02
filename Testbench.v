`timescale 1ns / 1ps


module Testbench ();
  reg Clock = 1'b0;  // Initialize here, only once
  reg Reset;
  wire [3:0] Count;

  // instantiate the design under verification (DUV)
  Mycounter I1(.CLK(Clock), .RST(Reset), .OUT(Count));

  // initialize the testbench
  initial begin
    $display("Starting simulation...");
    Reset = 1'b1;      // reset at time=0
    #100 Reset = 1'b0; // release reset at time=100
    #2000 Reset = 1'b1;// assert reset again at time=2100
    #400 $finish;      // finish simulation at time=2500
  end

  // generate clock with period 100 time units
  always #50 Clock = ~Clock;

  // monitor and dump waveforms
  initial begin
    $dumpfile("count.vcd");
    $dumpvars(0, Testbench);
    $monitor("%d, %b, %b, %d", $time, Clock, Reset, Count);
  end
endmodule


