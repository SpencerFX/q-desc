/ ==================================================
/ simulator utility functions
/ ==================================================

/ --------------------------------------------------
/ type label from type code
/ --------------------------------------------------
.sim.util.typeLabel:{[typeCode]
  code:`int$typeCode;
  $[code=-19;"timeAtom";
    code=-18;"secondAtom";
    code=-17;"minuteAtom";
    code=-16;"timespanAtom";
    code=-15;"datetimeAtom";
    code=-14;"dateAtom";
    code=-13;"monthAtom";
    code=-12;"timestampAtom";
    code=-11;"symbolAtom";
    code=-10;"charAtom";
    code=-9;"floatAtom";
    code=-8;"realAtom";
    code=-7;"longAtom";
    code=-6;"intAtom";
    code=-5;"shortAtom";
    code=-4;"byteAtom";
    code=-2;"guidAtom";
    code=-1;"booleanAtom";
    code=0;"generalList";
    code=1;"booleanList";
    code=2;"guidList";
    code=4;"byteList";
    code=5;"shortList";
    code=6;"intList";
    code=7;"longList";
    code=8;"realList";
    code=9;"floatList";
    code=10;"charList";
    code=11;"symbolList";
    code=12;"timestampList";
    code=13;"monthList";
    code=14;"dateList";
    code=15;"datetimeList";
    code=16;"timespanList";
    code=17;"minuteList";
    code=18;"secondList";
    code=19;"timeList";
    code=98;"dictionary";
    code=99;"table";
    code=100;"lambda";
    code=101;"genericNull";
    code=104;"projection";
    code=105;"primitive";
    "unknown(",string code,")"]
 };

/ --------------------------------------------------
/ safe preview
/ --------------------------------------------------
.sim.util.preview:{[objVal]
  @[{$[99h=type x;"table[",string count x,"] ",.Q.s1 x;.Q.s1 x]};objVal;{"<unprintable>"}]
 };

/ --------------------------------------------------
/ build one registry row
/ --------------------------------------------------
.sim.util.row:{[name;category;subCategory;objVal]
  ([] name:enlist name;
      category:enlist category;
      subCategory:enlist subCategory;
      typeCode:enlist type objVal;
      typeName:enlist .sim.util.typeLabel type objVal;
      value:enlist objVal)
 };