/ ==================================================
/ keyword capture functions
/ ==================================================

/ --------------------------------------------------
/ map q type code to readable label
/ --------------------------------------------------
.test.kw.typeLabel:{[typeCode]
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
/ generate safe printable preview of object
/ --------------------------------------------------
.test.kw.preview:{[objVal]
  @[{$[99h=type x;"table[",string count x,"] ",.Q.s1 x;.Q.s1 x]};objVal;{"<unprintable>"}]
 };

/ --------------------------------------------------
/ resolve keyword function symbol safely
/ --------------------------------------------------
.test.kw.resolve:{[fnSym]
  @[value;fnSym;{(::)}]
 };

/ --------------------------------------------------
/ test whether keyword function exists
/ --------------------------------------------------
.test.kw.exists:{[fnSym]
  fnVal:.test.kw.resolve fnSym;
  not fnVal~(::)
 };

/ --------------------------------------------------
/ execute keyword example safely
/ --------------------------------------------------
.test.kw.run:{[fnVal]
  ok:1b;
  errText:"";
  resultVal:@[{x[]};fnVal;{ok::0b;errText::string x;(::)}];
  `ok`errorText`resultValue!(ok;errText;resultVal)
 };

/ --------------------------------------------------
/ capture keyword example execution metadata
/ --------------------------------------------------
.test.kw.capture:{[kwLabel;fnSym]
  fnExists:.test.kw.exists fnSym;
  fnVal:.test.kw.resolve fnSym;

  ok:0b;
  errText:"function not found";
  resultVal:(::);

  if[fnExists;
    runInfo:.test.kw.run fnVal;
    ok:runInfo`ok;
    errText:runInfo`errorText;
    resultVal:runInfo`resultValue
  ];

  resultTypeCode:$[ok;type resultVal;0Nh];
  resultTypeName:$[ok;.test.kw.typeLabel resultTypeCode;""];
  resultPreview:$[ok;.test.kw.preview resultVal;""];

  ([] keywordLabel:enlist kwLabel;
     functionSymbol:enlist fnSym;
     functionExists:enlist fnExists;
     ok:enlist ok;
     resultTypeCode:enlist resultTypeCode;
     resultTypeName:enlist resultTypeName;
     resultPreview:enlist resultPreview;
     errorText:enlist errText;
     resultValue:enlist resultVal)
 };