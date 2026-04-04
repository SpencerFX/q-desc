/ ==================================================
/ simulator dictionary generation
/ ==================================================

/ --------------------------------------------------
/ generate dictionaries
/ --------------------------------------------------
.sim.data.dictionaries.build:{[]
  rows:.sim.registry.empty[];

  rows:.sim.registry.append[rows;.sim.util.row[`simpleDict;`dictionary;`simple;`a`b`c!10 20 30]];
  rows:.sim.registry.append[rows;.sim.util.row[`mixedDict;`dictionary;`mixed;`a`b`c!(1;`x;"abc")]];
  rows:.sim.registry.append[rows;.sim.util.row[`listDict;`dictionary;`lists;`sym`px!(`a`b`c;10 20 30)]];
  rows:.sim.registry.append[rows;.sim.util.row[`nestedDict;`dictionary;`nested;`left`right!((`a`b!1 2);([] x:1 2; y:`u`v))]];

  rows
 };