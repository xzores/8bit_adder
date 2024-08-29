/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Instantiate the Adder module
  Adder adder_instance (
    .clock(clk),        // Connect clock signal to clk
    .reset(~rst_n),     // Connect reset signal, assuming reset_n is active low
    .io_a(ui_in),       // Connect io_a to ui_in
    .io_b(uio_in),      // Connect io_b to uio_in
    .io_c(uo_out)       // Connect io_c to uo_out
  );

  // Unused signals
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, 1'b0};

endmodule
