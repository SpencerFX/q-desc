/ ==================================================
/ simulator table generation
/ ==================================================

/ --------------------------------------------------
/ generate tables
/ --------------------------------------------------
.sim.data.tables.build:{[]
  rows:.sim.registry.empty[];

  tradeTbl:([] sym:`a`b`c`a;
               px:10.5 20.5 30.5 11.5;
               qty:100 200 300 150;
               dt:2024.01.01 2024.01.01 2024.01.02 2024.01.02);

  keyedTrade:`sym xkey tradeTbl;

  mixedTbl:([] sym:`x`y`z;
              flag:101b;
              txt:("aa";"bb";"cc");
              tm:09:30:00.000 09:31:00.000 09:32:00.000);

  rows:.sim.registry.append[rows;.sim.util.row[`tradeTable;`table;`unkeyed;tradeTbl]];
  rows:.sim.registry.append[rows;.sim.util.row[`keyedTradeTable;`table;`keyed;keyedTrade]];
  rows:.sim.registry.append[rows;.sim.util.row[`mixedTable;`table;`unkeyed;mixedTbl]];

  rows
 };