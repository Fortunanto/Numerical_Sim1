module AND2 (
    input logic A,
    input logic B,
    output logic Z
);

parameter Tpdlh = 1;
parameter Tpdhl = 1;

and #(Tpdlh, Tpdhl) and1 (Z, A, B);

endmodule
