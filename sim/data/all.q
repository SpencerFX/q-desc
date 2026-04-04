/ ==================================================
/ simulator all data builder
/ ==================================================

/ --------------------------------------------------
/ build all simulator data
/ --------------------------------------------------
.sim.data.all.build:{[]
  rows:.sim.registry.empty[];
  rows:.sim.registry.append[rows;.sim.data.atoms.build[]];
  rows:.sim.registry.append[rows;.sim.data.lists.build[]];
  rows:.sim.registry.append[rows;.sim.data.dictionaries.build[]];
  rows:.sim.registry.append[rows;.sim.data.tables.build[]];
  rows:.sim.registry.append[rows;.sim.data.nested.build[]];
  rows
 };