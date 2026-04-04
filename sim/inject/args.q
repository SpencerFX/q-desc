/ ==================================================
/ simulator argument builders
/ ==================================================

/ --------------------------------------------------
/ build one-arg cases
/ --------------------------------------------------
.sim.inject.args.single:{[registryTbl]
  ([] name:registryTbl`name;
      argList:enlist each registryTbl`value)
 };

/ --------------------------------------------------
/ build two-arg cases
/ --------------------------------------------------
.sim.inject.args.pairs:{[registryTbl]
  vals:registryTbl`value;
  n:count vals;
  i:0;
  rows:([] leftIdx:`long$();rightIdx:`long$();argList:());

  while[i<n;
    j:0;
    while[j<n;
      rows,: enlist ([] leftIdx:enlist i;
                         rightIdx:enlist j;
                         argList:enlist enlist[vals i;vals j]);
      j+:1
    ];
    i+:1
  ];

  rows
 };