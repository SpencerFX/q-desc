/ ==================================================
/ simulator nested structure generation
/ ==================================================

/ --------------------------------------------------
/ generate nested objects
/ --------------------------------------------------
.sim.data.nested.build:{[]
  rows:.sim.registry.empty[];

  rows:.sim.registry.append[rows;.sim.util.row[`tableList;`nested;`tableList;(([] a:1 2);([] a:3 4))]];
  rows:.sim.registry.append[rows;.sim.util.row[`dictOfTables;`nested;`dictOfTables;`t1`t2!(([] x:1 2);([] x:3 4))]];
  rows:.sim.registry.append[rows;.sim.util.row[`tableWithListCol;`nested;`tableWithListCol;([] sym:`a`b; vals:(1 2 3;4 5))]];

  rows
 };