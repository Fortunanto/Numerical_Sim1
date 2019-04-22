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
logic nor_o,nand_o,res_o;
logic and_t;
// nand

AND2 #(.Tpdlh(2),.Tpdhl(12)) and_inst(.Z(and_t),.A(a),.B(b));
NOR2 #(.Tpdlh(10),.Tpdhl(8)) flip_and_inst(.Z(nand_o),.A(and_t),.B(and_t));
// nor
NOR2 #(.Tpdlh(10),.Tpdhl(8)) nor_inst(.Z(nor_o),.A(a),.B(b));

// add / sub 
fas add_inst(.cout(cout),.s(res_o),.cin(cin),.a(a),.b(b),.a_ns(op[0]));

// end choice
mux4 mux_inst(.z(s),.d0(nand_o),.d1(nor_o),.d2(res_o),.d3(res_0),.sel(op));

// End of your code

endmodule
