/ ==================================================
/ iterator capture functions
/ ==================================================

/ --------------------------------------------------
/ map q type code to readable label
/ --------------------------------------------------
.test.iter.typeLabel:{[typeCode]
  codes:-19 -18 -17 -16 -15 -14 -13 -12 -11 -10 -9 -8 -7 -6 -5 -4 -2 -1 0 1 2 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 98 99 100 104 105;
  labels:`timeAtom`secondAtom`minuteAtom`timespanAtom`datetimeAtom`dateAtom`monthAtom`timestampAtom`symbolAtom`charAtom`floatAtom`realAtom`longAtom`intAtom`shortAtom`byteAtom`guidAtom`booleanAtom`generalList`booleanList`guidList`byteList`shortList`intList`longList`realList`floatList`charList`symbolList`timestampList`monthList`dateList`datetimeList`timespanList`minuteList`secondList`timeList`dictionary`table`lambda`projection`primitive;
  idx:codes?typeCode;
  $[idx<count codes;string labels idx;"unknown(",string typeCode,")"]
 };

/ --------------------------------------------------
/ generate safe printable preview of object
/ --------------------------------------------------
.test.iter.preview:{[objVal]
  out:"";
  @[{$[99h=type x;out::"table[",string count x,"]";out::.Q.s1 x];::()};objVal;{out::"<unprintable>";::()}];
  out
 };

/ --------------------------------------------------
/ normalize args into general list
/ --------------------------------------------------
.test.iter.normalizeArgs:{[argVals]
  $[0h=type argVals;argVals;enlist argVals]
 };

/ --------------------------------------------------
/ capture iterator execution metadata and result
/ --------------------------------------------------
.test.iter.capture:{[iteratorName;derivedFunc;argVals]
  argList:.test.iter.normalizeArgs argVals;
  ok:1b;
  errText:"";
  resultVal:(::);

  .[derivedFunc;argList;{ok::0b;errText::string x;resultVal::(::);::()}];

  argTypeCodes:type each argList;
  argTypeNames:.test.iter.typeLabel each argTypeCodes;
  argPreviews:.test.iter.preview each argList;
  resultTypeCode:$[ok;type resultVal;0N];
  resultTypeName:$[ok;.test.iter.typeLabel resultTypeCode;""];
  resultPreview:$[ok;.test.iter.preview resultVal;""];

  ([] iteratorName:enlist iteratorName;
     argCount:enlist count argList;
     argTypeCodes:enlist argTypeCodes;
     argTypeNames:enlist argTypeNames;
     argPreviews:enlist argPreviews;
     ok:enlist ok;
     resultTypeCode:enlist resultTypeCode;
     resultTypeName:enlist resultTypeName;
     resultPreview:enlist resultPreview;
     errorText:enlist errText;
     resultValue:enlist resultVal)
 };