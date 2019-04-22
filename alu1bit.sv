// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
logic nor_o,nand_o,add_o,sub_o,arithm_o;
logic and_t;
logic add_cout, sub_cout;
// nand

AND2 and_inst(.Z(and_t),.A(a),.B(b));
NOR2 flip_and_inst(.Z(nand_o),.A(and_t),.B(and_t));
// nor
NOR2 nor_inst(.Z(nor_o),.A(a),.B(b));

// add / sub 
fas add_inst(.cout(add_cout),.s(add_o),.cin(cin),.a(a),.b(b),.a_ns(op[0]));
fas add_inst(.cout(sub_cout),.s(sub_o),.cin(cin),.a(a),.b(b),.a_ns(op[0]));
// cout decision
mux2 mux_cout_inst(.z(cout),.sel(op[0]),.d0(add_cout),.d1(sub_cout));

// end choice
mux4 mux_inst(.z(s),.d0(nand_o),.d1(nor_o),.d2(add_o),.d3(sub_o),.sel(op));

// End of your code

endmodule
