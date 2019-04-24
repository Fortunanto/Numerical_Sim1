// Full Adder/Subtractor test bench template
module fas_test;

// Put your code here
// ------------------
logic a_ns, a, b, cin;
logic cout,s;

initial
begin
a_ns=1;
a=0;
b=0;
cin=0;
end

fas fas_inst(.a(a),.b(b),.cin(cin),.a_ns(a_ns),.cout(cout),.s(s));

// End of your code

endmodule
