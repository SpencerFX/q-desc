/ ==================================================
/ simulator random helpers
/ ==================================================

/ --------------------------------------------------
/ set random seed
/ --------------------------------------------------
.sim.rand.seed:{[seedVal]
  system "S ",string seedVal;
  seedVal
 };

/ --------------------------------------------------
/ random symbol vector
/ --------------------------------------------------
.sim.rand.symbols:{[countVal]
  (`alpha`beta`gamma`delta`omega`theta`kappa`lambda) countVal?`alpha`beta`gamma`delta`omega`theta`kappa`lambda
 };