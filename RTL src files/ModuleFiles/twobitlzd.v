`timescale 1ns / 1ps

//this module makes up the leaves of the leading zero detecting tree generated by lzdetector
//given its short length, it should probably simply be incorparted into lzdetector in the length==2 case
module twobitlzd(
    output wire p,
    output wire v,
    input wire a,
    input wire b
    );
    assign p = (!a)&b;
    assign v = a|b;
endmodule