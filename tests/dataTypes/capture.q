/ ==================================================
/ data type capture functions
/ ==================================================

/ --------------------------------------------------
/ map q type code to readable label
/ --------------------------------------------------
.test.dt.typeLabel:{[typeCode]
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
    code=104;"projection";
    code=105;"primitive";
    "unknown(",string code,")"]
 };

/ --------------------------------------------------
/ generate safe printable preview of object
/ --------------------------------------------------
.test.dt.preview:{[objVal]
  @[{$[99h=type x;"table[",string count x,"] ",.Q.s1 x;.Q.s1 x]};objVal;{"<unprintable>"}]
 };

/ --------------------------------------------------
/ normalize args into general list
/ --------------------------------------------------
.test.dt.normalizeArgs:{[argVals]
  $[0h=type argVals;argVals;enlist argVals]
 };

/ --------------------------------------------------
/ test whether object is atom
/ --------------------------------------------------
.test.dt.isAtom:{[objVal]
  0>type objVal
 };

/ --------------------------------------------------
/ test whether object is list
/ --------------------------------------------------
.test.dt.isList:{[objVal]
  0<=type objVal
 };

/ --------------------------------------------------
/ execute datatype function safely
/ --------------------------------------------------
.test.dt.run:{[dtFunc;argList]
  ok:1b;
  errText:"";

  resultVal:$[
    0=count argList;
      @[ {[fn] fn[]} ; dtFunc ; {ok::0b;errText::string x;(::)} ];
      .[dtFunc;argList;{ok::0b;errText::string x;(::)}]
  ];

  `ok`errorText`resultValue!(ok;errText;resultVal)
 };

/ --------------------------------------------------
/ capture datatype execution metadata and result
/ --------------------------------------------------
.test.dt.capture:{[dtName;dtFunc;argVals]
  argList:.test.dt.normalizeArgs argVals;
  runInfo:.test.dt.run[dtFunc;argList];
  ok:runInfo`ok;
  errText:runInfo`errorText;
  resultVal:runInfo`resultValue;

  argTypeCodes:type each argList;
  argTypeNames:.test.dt.typeLabel each argTypeCodes;
  argPreviews:.test.dt.preview each argList;
  argAtomFlags:.test.dt.isAtom each argList;
  argListFlags:.test.dt.isList each argList;

  resultTypeCode:$[ok;type resultVal;0Nh];
  resultTypeName:$[ok;.test.dt.typeLabel resultTypeCode;""];
  resultPreview:$[ok;.test.dt.preview resultVal;""];
  resultIsAtom:$[ok;.test.dt.isAtom resultVal;0b];
  resultIsList:$[ok;.test.dt.isList resultVal;0b];

  ([] dtName:enlist dtName;
     argCount:enlist count argList;
     argTypeCodes:enlist argTypeCodes;
     argTypeNames:enlist argTypeNames;
     argPreviews:enlist argPreviews;
     argAtomFlags:enlist argAtomFlags;
     argListFlags:enlist argListFlags;
     ok:enlist ok;
     resultTypeCode:enlist resultTypeCode;
     resultTypeName:enlist resultTypeName;
     resultPreview:enlist resultPreview;
     resultIsAtom:enlist resultIsAtom;
     resultIsList:enlist resultIsList;
     errorText:enlist errText;
     resultValue:enlist resultVal)
 };