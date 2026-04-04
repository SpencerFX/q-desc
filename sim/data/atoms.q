/ ==================================================
/ simulator atom generation
/ ==================================================

/ --------------------------------------------------
/ generate atom coverage set
/ --------------------------------------------------
.sim.data.atoms.build:{[]
  rows:.sim.registry.empty[];

  rows:.sim.registry.append[rows;.sim.util.row[`boolAtom;`atom;`boolean;1b]];
  rows:.sim.registry.append[rows;.sim.util.row[`guidAtom;`atom;`guid;.Q.n]];
  rows:.sim.registry.append[rows;.sim.util.row[`byteAtom;`atom;`byte;0x2a]];
  rows:.sim.registry.append[rows;.sim.util.row[`shortAtom;`atom;`short;42h]];
  rows:.sim.registry.append[rows;.sim.util.row[`intAtom;`atom;`int;42i]];
  rows:.sim.registry.append[rows;.sim.util.row[`longAtom;`atom;`long;42j]];
  rows:.sim.registry.append[rows;.sim.util.row[`realAtom;`atom;`real;42e]];
  rows:.sim.registry.append[rows;.sim.util.row[`floatAtom;`atom;`float;42f]];
  rows:.sim.registry.append[rows;.sim.util.row[`charAtom;`atom;`char;"z"]];
  rows:.sim.registry.append[rows;.sim.util.row[`symbolAtom;`atom;`symbol;`alpha]];
  rows:.sim.registry.append[rows;.sim.util.row[`timestampAtom;`atom;`timestamp;2024.01.01D12:34:56.000000000]];
  rows:.sim.registry.append[rows;.sim.util.row[`monthAtom;`atom;`month;2024.01m]];
  rows:.sim.registry.append[rows;.sim.util.row[`dateAtom;`atom;`date;2024.01.01]];
  rows:.sim.registry.append[rows;.sim.util.row[`datetimeAtom;`atom;`datetime;2024.01.01T12:34:56.000]];
  rows:.sim.registry.append[rows;.sim.util.row[`timespanAtom;`atom;`timespan;0D12:34:56.000000000]];
  rows:.sim.registry.append[rows;.sim.util.row[`minuteAtom;`atom;`minute;12:34]];
  rows:.sim.registry.append[rows;.sim.util.row[`secondAtom;`atom;`second;12:34:56]];
  rows:.sim.registry.append[rows;.sim.util.row[`timeAtom;`atom;`time;12:34:56.789]];

  rows
 };