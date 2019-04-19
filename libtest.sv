/************************************************************************
 * Example testbench: instantiates 4 basic logic gates and applies      *
 * stimulus to the gate inputs. Prints out the outputs using $display   *
 * function.                                                            *
 ************************************************************************/
module libtest;

// Signal declarations
// ===================

// Gate output wires
logic z1, z2, z3;

// Gate inputs - declared as registers, since we need them to 'remember'
// values
logic a, b;

// The test bench: try different input combinations at different points
// of time - change values every 10 time units.
// ====================================================================
initial
begin
    a = 0;
    b = 0;
    #10;
    a = 1;
    #10;
    b = 1;
    #10 $finish;
end

// Gate instantiations
// ===================

// For this gate we override the default delays with: Tpdlh=5 and Tpdhl=7
AND2 #(.Tpdlh(5), .Tpdhl(7)) and2_inst ( .Z(z1), .A(a), .B(b) );

// All the other gates stay with default (unit) delays, coded inside their
// respective module definitions.
NOR2 nor2_inst ( .Z(z2), .A(a), .B(b) );
XOR2 xor2_inst ( .Z(z3), .A(a), .B(b) );

// Print out the output values on every change
// ===========================================
always @(*)
    $display("%t: outputs changed to %d,%d,%d", $time, z1,z2,z3);

endmodule
