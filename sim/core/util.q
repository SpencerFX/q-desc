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
      val:enlist objVal)
 };

/ --------------------------------------------------
/ random symbol list helper
/ --------------------------------------------------
.sim.exec.randSyms:{[countVal]
  countVal?`alpha`beta`gamma`delta`omega`theta`lambda`sigma
 };

/ --------------------------------------------------
/ random object by q type code
/ --------------------------------------------------
.sim.exec.randByType:{[typeCode;countVal]
  $[typeCode=-19; countVal?09:30:00.000 10:00:00.000 10:30:00.000 11:00:00.000;               / time atom fallback picks first later
    typeCode=-18; countVal?09:30:00 10:00:00 10:30:00 11:00:00;                               / second atom fallback
    typeCode=-17; countVal?09:30 10:00 10:30 11:00;                                           / minute atom fallback
    typeCode=-16; countVal?0D00:00:01.000000000 0D00:00:02.000000000 0D00:00:03.000000000;   / timespan atom fallback
    typeCode=-15; countVal?2024.01.01T09:30:00.000 2024.01.02T09:30:00.000 2024.01.03T09:30:00.000;
    typeCode=-14; countVal?2024.01.01 2024.01.02 2024.01.03 2024.01.04;
    typeCode=-13; countVal?2024.01 2024.02 2024.03 2024.04m;
    typeCode=-12; countVal?2024.01.01D09:30:00.000000000 2024.01.02D09:30:00.000000000 2024.01.03D09:30:00.000000000;
    typeCode=-11; first .sim.exec.randSyms 1;
    typeCode=-10; first "abcdefghijklmnopqrstuvwxyz";
    typeCode=-9; first 100f?countVal;
    typeCode=-8; first 100e?countVal;
    typeCode=-7; first countVal?1000j;
    typeCode=-6; first countVal?1000i;
    typeCode=-5; first countVal?100h;
    typeCode=-4; first 0x010203040506;
    typeCode=-2; .Q.n;
    typeCode=-1; first 01b;

    typeCode=0; (first countVal?100i;first .sim.exec.randSyms 1;first "abc";first countVal?100f);
    typeCode=1; countVal?01b;
    typeCode=2; countVal#.Q.n;
    typeCode=4; countVal#0x2a;
    typeCode=5; countVal?100h;
    typeCode=6; countVal?1000i;
    typeCode=7; countVal?1000j;
    typeCode=8; countVal?100e;
    typeCode=9; countVal?100f;
    typeCode=10; countVal#"abcdefghijklmnopqrstuvwxyz";
    typeCode=11; .sim.exec.randSyms countVal;
    typeCode=12; countVal?2024.01.01D09:30:00.000000000 2024.01.02D09:30:00.000000000 2024.01.03D09:30:00.000000000;
    typeCode=13; countVal?2024.01 2024.02 2024.03 2024.04m;
    typeCode=14; countVal?2024.01.01 2024.01.02 2024.01.03 2024.01.04;
    typeCode=15; countVal?2024.01.01T09:30:00.000 2024.01.02T09:30:00.000 2024.01.03T09:30:00.000;
    typeCode=16; countVal?0D00:00:01.000000000 0D00:00:02.000000000 0D00:00:03.000000000;
    typeCode=17; countVal?09:30 10:00 10:30 11:00;
    typeCode=18; countVal?09:30:00 10:00:00 10:30:00 11:00:00;
    typeCode=19; countVal?09:30:00.000 10:00:00.000 10:30:00.000 11:00:00.000;
    / Here we need to check to see if we want to generate a dictionary or a keyed table
    typeCode=98; `a`b!(countVal?100i;.sim.exec.randSyms countVal);
    typeCode=99; ([] c1:countVal?100i; c2:.sim.exec.randSyms countVal);

    typeCode=100; {x};
    typeCode=104; (+)[;1];
    typeCode=105; +;

    ::]
 };

/ --------------------------------------------------
/ normalize atom generator outputs
/ --------------------------------------------------
.sim.exec.randArg:{[typeCode;countVal]
  genVal:.sim.exec.randByType[typeCode;countVal];

  $[typeCode<0; first enlist genVal; genVal]
 };

/ --------------------------------------------------
/ extract non-null argument codes from signature row
/ --------------------------------------------------
.sim.exec.argCodesFromRow:{[sigRow]
  codeVals:(sigRow`arg1;sigRow`arg2;sigRow`arg3;sigRow`arg4;sigRow`arg5;sigRow`arg6;sigRow`arg7;sigRow`arg8);
  codeVals where not null codeVals
 };

/ --------------------------------------------------
/ build random argument list from one signature row
/ --------------------------------------------------
.sim.exec.argsFromSigRow:{[sigRow;countVal]
  codeVals:.sim.exec.argCodesFromRow sigRow;
  .sim.exec.randArg'[codeVals;count codeVals#countVal]
 };

/ --------------------------------------------------
/ get first matching signature row for a function
/ --------------------------------------------------
.sim.exec.sigRow:{[sigTbl;fnSym]
  matchTbl:select from sigTbl where functionName=fnSym;
  if[0=count matchTbl;
    :()
  ];
  first matchTbl
 };

/ --------------------------------------------------
/ execute one function using signature-generated args
/ --------------------------------------------------
.sim.exec.callBySig:{[sigTbl;fnSym;countVal]
  sigRow:.sim.exec.sigRow[sigTbl;fnSym];
  .sp.sigRow:sigRow;
  if[0=count sigRow;
    :`functionName`ok`argCodes`args`result`error!(
      fnSym;
      0b;
      ();
      ();
      ::;
      "function not found in sigTbl")
  ];

  argCodes:.sim.exec.argCodesFromRow sigRow;
  .sp.argCodes:argCodes;
  / Below creates the data from the arg codes
  argList:.sim.exec.argsFromSigRow[sigRow;countVal];
  .sp.argList:argList;
  fnVal:value fnSym;

  okFlag:1b;
  errTxt:"";
  resultVal:.[
    fnVal;
    argList;
    {
      okFlag::0b;
      errTxt::string x;
      ::
    }
  ];

  `functionName`ok`argCodes`args`result`error!(
    fnSym;
    okFlag;
    argCodes;
    argList;
    string resultVal;
    errTxt)
 };
/ --------------------------------------------------
/ preview multiple runs for a function
/ --------------------------------------------------
.sim.exec.sampleCalls:{[sigTbl;fnSym;countVal;runCount]
  outTbl:([] functionName:`symbol$(); ok:`boolean$(); argCodes:(); args:(); result:(); error:());

  idxVal:0;
  while[idxVal<runCount;
    callDict:.sim.exec.callBySig[sigTbl;fnSym;countVal];
    outTbl,:enlist ([] functionName:enlist callDict`functionName;
                       ok:enlist callDict`ok;
                       argCodes:enlist callDict`argCodes;
                       args:enlist callDict`args;
                       result:enlist callDict`result;
                       error:enlist callDict`error);
    idxVal+:1
  ];

  outTbl
 };