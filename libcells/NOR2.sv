module NOR2 (
    input logic A,
    input logic B,
    output logic Z
);

parameter Tpdlh = 1;
parameter Tpdhl = 1;

nor #(Tpdlh, Tpdhl) nor1 (Z, A, B);

endmodule
