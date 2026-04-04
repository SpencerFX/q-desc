/ ==================================================
/ simulator argument builders
/ ==================================================

/ --------------------------------------------------
/ build one-arg cases
/ --------------------------------------------------
.sim.inject.args.single:{[registryTbl]
  ([] name:registryTbl`name;
      argList:enlist each registryTbl`val)
 };
/ --------------------------------------------------
/ build two-arg cases
/ --------------------------------------------------
.sim.inject.args.pairs:{[registryTbl]
  names:registryTbl`name;
  vals:registryTbl`objVal;
  n:count vals;
  i:0;

  leftIdxs:();
  rightIdxs:();
  leftNames:`symbol$();
  rightNames:`symbol$();
  argLists:();

  while[i<n;
    j:0;

    while[j<n;
      leftIdxs,:enlist i;
      rightIdxs,:enlist j;
      leftNames,:enlist names i;
      rightNames,:enlist names j;
      argLists,:enlist enlist[vals i;vals j];
      j+:1
    ];

    i+:1
  ];

  ([] leftIdx:`long$leftIdxs;
      rightIdx:`long$rightIdxs;
      leftName:leftNames;
      rightName:rightNames;
      argList:argLists)
 };