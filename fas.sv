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

logic xo1;
logic xo2;

logic no1;
logic no2;
logic no3;
logic no4;
logic no6;
//logic no7;
logic no8;
logic no9;
logic no10;

logic an1;
logic an2;
logic an3;
logic an4;

XOR2 xor1(.Z(xo1),.A(a_ns),.B(a));
NOR2 nor1(.Z(no1),.A(xo1),.B(xo1));
AND2 and1(.Z(an1),.A(no1),.B(no3));
NOR2 nor4(.Z(no4),.A(an1),.B(an2));
NOR2 nor5(.Z(cout),.A(no4),.B(no4));
NOR2 nor2(.Z(no2),.A(b),.B(cin));
NOR2 nor3(.Z(no3),.A(no2),.B(no2));
AND2 and2(.Z(an2),.A(cin),.B(b)); // and2 = AND(cin,b)
//NOR2 nor7(.Z(no7),.A(an2),.B(an2)); // nor7 = NOR(and2,and2) = NOT(and2) = NAND(cin,b)
NOR2 nor8(.Z(no8),.A(a),.B(a)); // nor8 = NOT(a)
AND2 and4(.Z(an4),.A(xo2),.B(no8)); // and4 = AND(xo2,nor8) = AND(XOR(b,cin),NOT(a))
XOR2 xor2(.Z(xo2),.A(b),.B(cin)); // xor2 = XOR(b,cin)
NOR2 nor6(.Z(no6),.A(xo2),.B(xo2)); // nor6 = NOT(xor2) = XNOR(b,cin)
AND2 and3(.Z(an3),.A(a),.B(no6)); // and3 = AND(a,nor6) = AND(a,XNOR(b,cin))
NOR2 nor9(.Z(no9),.A(an4),.B(an3)); // nor9 = NOR(and4,and3) = NOR(AND(NAND(cin,b),NOT(a)),AND(a,XNOR(b,cin)))
NOR2 nor10(.Z(s),.A(no9),.B(no9)); // nor10 = NOT(nor9)
// End of your code

endmodule
