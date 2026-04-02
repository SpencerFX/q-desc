/ ==================================================
/ table capture functions
/ ==================================================

/ --------------------------------------------------
/ map q type code to readable label
/ --------------------------------------------------
.test.tbl.typeLabel:{[typeCode]
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
.test.tbl.preview:{[objVal]
  @[{$[99h=type x;"table[",string count x,"] ",.Q.s1 x;.Q.s1 x]};objVal;{"<unprintable>"}]
 };

/ --------------------------------------------------
/ normalize args into general list
/ --------------------------------------------------
.test.tbl.normalizeArgs:{[argVals]
  $[0h=type argVals;argVals;enlist argVals]
 };

/ --------------------------------------------------
/ test whether object is keyed table
/ --------------------------------------------------
.test.tbl.isKeyedTable:{[objVal]
  99h=type objVal
 };

/ --------------------------------------------------
/ test whether object is unkeyed table
/ --------------------------------------------------
.test.tbl.isTable:{[objVal]
  98h=type objVal
 };

/ --------------------------------------------------
/ execute table function safely
/ --------------------------------------------------
.test.tbl.run:{[tableFunc;argList]
  ok:1b;
  errText:"";

  resultVal:$[
    0=count argList;
      @[ {[fn] fn[]} ; tableFunc ; {ok::0b;errText::string x;(::)} ];
      .[tableFunc;argList;{ok::0b;errText::string x;(::)}]
  ];

  `ok`errorText`resultValue!(ok;errText;resultVal)
 };

/ --------------------------------------------------
/ capture table execution metadata and result
/ --------------------------------------------------
.test.tbl.capture:{[tableName;tableFunc;argVals]
  argList:.test.tbl.normalizeArgs argVals;
  runInfo:.test.tbl.run[tableFunc;argList];
  ok:runInfo`ok;
  errText:runInfo`errorText;
  resultVal:runInfo`resultValue;

  argTypeCodes:type each argList;
  argTypeNames:.test.tbl.typeLabel each argTypeCodes;
  argPreviews:.test.tbl.preview each argList;
  argKeyedFlags:.test.tbl.isKeyedTable each argList;
  argTableFlags:(.test.tbl.isTable each argList) or argKeyedFlags;

  resultTypeCode:$[ok;type resultVal;0Nh];
  resultTypeName:$[ok;.test.tbl.typeLabel resultTypeCode;""];
  resultPreview:$[ok;.test.tbl.preview resultVal;""];
  resultIsTable:$[ok;98h=type resultVal;0b];
  resultIsKeyedTable:$[ok;99h=type resultVal;0b];
  resultRowCount:$[ok;$[98h=type resultVal;count resultVal;$[99h=type resultVal;count value resultVal;0Nj]];0Nj];
  resultCols:$[ok;$[98h=type resultVal;cols resultVal;$[99h=type resultVal;cols value resultVal;`symbol$()]];`symbol$()];

  ([] tableName:enlist tableName;
     argCount:enlist count argList;
     argTypeCodes:enlist argTypeCodes;
     argTypeNames:enlist argTypeNames;
     argPreviews:enlist argPreviews;
     argKeyedFlags:enlist argKeyedFlags;
     argTableFlags:enlist argTableFlags;
     ok:enlist ok;
     resultTypeCode:enlist resultTypeCode;
     resultTypeName:enlist resultTypeName;
     resultPreview:enlist resultPreview;
     resultIsTable:enlist resultIsTable;
     resultIsKeyedTable:enlist resultIsKeyedTable;
     resultRowCount:enlist resultRowCount;
     resultCols:enlist resultCols;
     errorText:enlist errText;
     resultValue:enlist resultVal)
 };