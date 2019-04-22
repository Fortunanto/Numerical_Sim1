// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

// Put your code here
// ------------------

logic t0,t1;

mux2 t0_mux_inst(.z(t0),.d0(d0),.d1(d1),.sel(sel[0]));
mux2 t1_mux_inst(.z(t1),.d0(d2),.d1(d3),.sel(sel[0]));
mux2 o1_mux_inst(.z(z),.d0(t0),.d1(t1),.sel(sel[1]));

// End of your code

endmodule
