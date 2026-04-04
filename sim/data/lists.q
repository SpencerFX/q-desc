/ ==================================================
/ simulator list generation
/ ==================================================

/ --------------------------------------------------
/ generate typed and mixed lists
/ --------------------------------------------------
.sim.data.lists.build:{[]
  rows:.sim.registry.empty[];

  rows:.sim.registry.append[rows;.sim.util.row[`boolList;`list;`boolean;10110b]];
  rows:.sim.registry.append[rows;.sim.util.row[`byteList;`list;`byte;0x01020304]];
  rows:.sim.registry.append[rows;.sim.util.row[`shortList;`list;`short;1 2 3 4h]];
  rows:.sim.registry.append[rows;.sim.util.row[`intList;`list;`int;1 2 3 4i]];
  rows:.sim.registry.append[rows;.sim.util.row[`longList;`list;`long;1 2 3 4j]];
  rows:.sim.registry.append[rows;.sim.util.row[`realList;`list;`real;1 2 3 4e]];
  rows:.sim.registry.append[rows;.sim.util.row[`floatList;`list;`float;1 2 3 4f]];
  rows:.sim.registry.append[rows;.sim.util.row[`charList;`list;`char;"alpha"]];
  rows:.sim.registry.append[rows;.sim.util.row[`symbolList;`list;`symbol;`alpha`beta`gamma]];
  rows:.sim.registry.append[rows;.sim.util.row[`dateList;`list;`date;2024.01.01 2024.01.02 2024.01.03]];
  rows:.sim.registry.append[rows;.sim.util.row[`timeList;`list;`time;09:30:00.000 09:31:00.000 09:32:00.000]];
  rows:.sim.registry.append[rows;.sim.util.row[`generalList;`list;`mixed;(1;`a;"abc";2024.01.01)]];
  rows:.sim.registry.append[rows;.sim.util.row[`nestedGeneralList;`list;`nested;((1 2 3);(`a`b);("x";"y"))]];

  rows
 };