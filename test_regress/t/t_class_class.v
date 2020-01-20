// DESCRIPTION: Verilator: Verilog Test module
//
// This file ONLY is placed into the Public Domain, for any use,
// without warranty, 2020 by Wilson Snyder.

// Note UVM internals do not require classes-in-classes
package P;
class Cls;
   int imembera;
   int imemberb;
   class SubCls;
      int smembera;
      int smemberb;
   endclass : SubCls
   SubCls sc;
endclass : Cls
endpackage : P

module t (/*AUTOARG*/);
   P::Cls c;
   initial begin
      c = new;
      c.imembera = 10;
      c.imemberb = 20;
      c.sc = new;
      c.sc.smembera = 30;
      c.sc.smemberb = 40;
      if (c.imembera != 10) $stop;
      if (c.imemberb != 20) $stop;
      if (c.sc.smembera != 30) $stop;
      if (c.sc.smemberb != 40) $stop;
   end
endmodule