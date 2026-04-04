/ ==================================================
/ simulator smoke runner
/ ==================================================

/ --------------------------------------------------
/ run simulator smoke build
/ --------------------------------------------------
.sim.run.smoke:{[]
  reg:.sim.data.all.build[];
  summary:select count i by category from reg;
  show summary;
  reg
 };