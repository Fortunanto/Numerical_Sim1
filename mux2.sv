// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);
logic sel_not;
logic c0;
logic c1;
// Put your code here
// ------------------

NOR2 #(.Tpdlh(10),.Tpdhl(8)) not_sel_inst ( .Z(sel_not),.A(sel),.B(sel));
AND2 #(.Tpdlh(1),.Tpdhl(6)) sel_res0 (.Z(c0),.A(d0),.B(sel_not));  
AND2 #(.Tpdlh(1),.Tpdhl(6)) sel_res1 (.Z(c1),.A(d1),.B(sel));
XOR2 #(.Tpdlh(9),.Tpdhl(9)) out_res ( .Z(z),.A(c0),.B(c1)); 
// End of your code

endmodule
