// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------

logic [62:0] c_between;

alu1bit (.a(a[0]),.b(b[0]),.cin(cin),.op(op),.s(s[0]),.cout(c_between[1]));

generate
for (i=1; i<63; i++) begin
alu1bit (.a(a[i]),.b(b[i]),.cin(c_between[i-1]),.op(op),.s(s[i]),.cout(c_between[i+1]));
end
endgenerate
alu1bit (.a(a[63]),.b(b[63]),.cin(c_between[63]),.op(op),.s(s[62]),.cout(cout));

// End of your code

endmodule
