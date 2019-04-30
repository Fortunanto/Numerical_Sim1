// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------

logic ans_xor_a;
logic ans_xnor_a;

logic b_nor_c;
logic b_or_c;
logic b_and_c;
logic b_xor_c;

logic and_for_cout;

logic nor_for_cout;

XOR2 #(.Tpdlh(18),.Tpdhl(18)) xo1(.Z(ans_xor_a),.A(a_ns),.B(a));
NOR2 #(.Tpdlh(10),.Tpdhl(8)) no1(.Z(ans_xnor_a),.A(ans_xor_a),.B(ans_xor_a));

NOR2 #(.Tpdlh(10*2),.Tpdhl(8*2)) no2(.Z(b_nor_c),.A(b),.B(cin));
NOR2 #(.Tpdlh(10*2),.Tpdhl(8*2)) no3(.Z(b_or_c),.A(b_nor_c),.B(b_nor_c));

AND2 #(.Tpdlh(1),.Tpdhl(6)) an1(.Z(and_for_cout),.A(ans_xnor_a),.B(b_or_c));
NOR2 #(.Tpdlh(10*2),.Tpdhl(8*2)) no4(.Z(nor_for_cout),.A(and_for_cout),.B(b_and_c));
NOR2 #(.Tpdlh(0),.Tpdhl(0)) no5(.Z(cout),.A(nor_for_cout),.B(nor_for_cout));

AND2 #(.Tpdlh(1),.Tpdhl(6)) an2(.Z(b_and_c),.A(b),.B(cin));

XOR2 #(.Tpdlh(9),.Tpdhl(9)) xo2(.Z(b_xor_c),.A(b),.B(cin));
XOR2 #(.Tpdlh(0),.Tpdhl(0)) xo3(.Z(s),.A(a),.B(b_xor_c));

// end of your code

endmodule
