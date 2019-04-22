// 2->1 multiplexer test bench template
module mux2_test;

// Put your code here
// ------------------
logic a1,a2,a3;
logic z1;

initial
begin
    a1 = 0;
    a2 = 0;
    a3 = 0;
    #100;
    a1 = 0;
    a2 = 0;
    a3 = 1;
    #100;
    a1 = 0;
    a2 = 1;
    a3 = 0;
    #100;
    a1 = 0;
    a2 = 1;
    a3 = 1;
    #100;
    a1 = 1;
    a2 = 0;
    a3 = 0; // 1
    #100;
    a1 = 1;
    a2 = 0;
    a3 = 1; // 0
    #100;
    a1 = 1;
    a2 = 1;
    a3 = 0; // 1
    #100;
    a1 = 1;
    a2 = 1;
    a3 = 1;
    #100 $finish; //1

end
mux2 mux2_inst(.d0(a1), .d1(a2), .sel(a3), .z(z1) );

always @(*)
    $display("%t: outputs changed to %d", $time, z1);


endmodule
