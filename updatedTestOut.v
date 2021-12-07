

module counter
(
  clk,
  count
);

  wire _clockgate_output_;
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  input clk;
  output [3:0] count;

  sky130_fd_sc_hd__inv_2
  _08_
  (
    .A(count[0]),
    .Y(_07_)
  );


  sky130_fd_sc_hd__inv_2
  _09_
  (
    .A(count[1]),
    .Y(_01_)
  );


  sky130_fd_sc_hd__inv_2
  _10_
  (
    .A(count[2]),
    .Y(_02_)
  );


  sky130_fd_sc_hd__inv_2
  _11_
  (
    .A(count[3]),
    .Y(_03_)
  );


  sky130_fd_sc_hd__inv_2
  _12_
  (
    .A(count[0]),
    .Y(_00_)
  );


  sky130_fd_sc_hd__inv_2
  _13_
  (
    .A(count[2]),
    .Y(_04_)
  );


  sky130_fd_sc_hd__inv_2
  _14_
  (
    .A(clk),
    .Y(_05_)
  );


  sky130_fd_sc_hd__inv_2
  _15_
  (
    .A(count[1]),
    .Y(_06_)
  );


  sky130_fd_sc_hd__dfxtp_1
  _16_
  (
    .CLK(_clockgate_output_),
    .D(_03_),
    .Q(count[3])
  );


  sky130_fd_sc_hd__dfxtp_1
  _17_
  (
    .CLK(_clockgate_output_),
    .D(_00_),
    .Q(count[0])
  );


  sky130_fd_sc_hd__dfxtp_1
  _18_
  (
    .CLK(_clockgate_output_),
    .D(_02_),
    .Q(count[2])
  );


  sky130_fd_sc_hd__dfxtp_1
  _19_
  (
    .CLK(_clockgate_output_),
    .D(_01_),
    .Q(count[1])
  );


endmodule

