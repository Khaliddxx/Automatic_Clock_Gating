module test8bit(D_IN, CLK, EN, D_OUT);
  wire [7:0] _00_;
  input CLK;
  input [7:0] D_IN;
  output [7:0] D_OUT;
  input EN;
  sky130_fd_sc_hd__mux2_1 _01_ (
    .A0(D_OUT[5]),
    .A1(D_IN[5]),
    .S(EN),
    .X(_00_[5])
  );
  sky130_fd_sc_hd__mux2_1 _02_ (
    .A0(D_OUT[4]),
    .A1(D_IN[4]),
    .S(EN),
    .X(_00_[4])
  );
  sky130_fd_sc_hd__mux2_1 _03_ (
    .A0(D_OUT[0]),
    .A1(D_IN[0]),
    .S(EN),
    .X(_00_[0])
  );
  sky130_fd_sc_hd__mux2_1 _04_ (
    .A0(D_OUT[2]),
    .A1(D_IN[2]),
    .S(EN),
    .X(_00_[2])
  );
  sky130_fd_sc_hd__mux2_1 _05_ (
    .A0(D_OUT[1]),
    .A1(D_IN[1]),
    .S(EN),
    .X(_00_[1])
  );
  sky130_fd_sc_hd__mux2_1 _06_ (
    .A0(D_OUT[7]),
    .A1(D_IN[7]),
    .S(EN),
    .X(_00_[7])
  );
  sky130_fd_sc_hd__mux2_1 _07_ (
    .A0(D_OUT[3]),
    .A1(D_IN[3]),
    .S(EN),
    .X(_00_[3])
  );
  sky130_fd_sc_hd__mux2_1 _08_ (
    .A0(D_OUT[6]),
    .A1(D_IN[6]),
    .S(EN),
    .X(_00_[6])
  );
  sky130_fd_sc_hd__dfxtp_1 _09_ (
    .CLK(CLK),
    .D(_00_[0]),
    .Q(D_OUT[0])
  );
  sky130_fd_sc_hd__dfxtp_1 _10_ (
    .CLK(CLK),
    .D(_00_[1]),
    .Q(D_OUT[1])
  );
  sky130_fd_sc_hd__dfxtp_1 _11_ (
    .CLK(CLK),
    .D(_00_[2]),
    .Q(D_OUT[2])
  );
  sky130_fd_sc_hd__dfxtp_1 _12_ (
    .CLK(CLK),
    .D(_00_[3]),
    .Q(D_OUT[3])
  );
  sky130_fd_sc_hd__dfxtp_1 _13_ (
    .CLK(CLK),
    .D(_00_[4]),
    .Q(D_OUT[4])
  );
  sky130_fd_sc_hd__dfxtp_1 _14_ (
    .CLK(CLK),
    .D(_00_[5]),
    .Q(D_OUT[5])
  );
  sky130_fd_sc_hd__dfxtp_1 _15_ (
    .CLK(CLK),
    .D(_00_[6]),
    .Q(D_OUT[6])
  );
  sky130_fd_sc_hd__dfxtp_1 _16_ (
    .CLK(CLK),
    .D(_00_[7]),
    .Q(D_OUT[7])
  );
endmodule
