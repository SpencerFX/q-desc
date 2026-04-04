/ ==================================================
/ simulator preview runner
/ ==================================================

/ --------------------------------------------------
/ preview first few generated rows
/ --------------------------------------------------
.sim.run.preview:{[]
  reg:.sim.data.all.build[];
  show select name,category,subCategory,typeName from reg;
  reg
 };