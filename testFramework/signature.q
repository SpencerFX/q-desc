/ ==================================================
/ testFramework signature resolution
/ ==================================================
/ For each function discover.q finds in a file, decides whether it
/ can be safely fuzz-executed: niladic functions need no arguments at
/ all; parametrized functions need a real //@param type-code
/ annotation (analyze/'s .analyze.sig.fromFile format - the same
/ shape sim/'s fuzzer already consumes) covering every declared
/ parameter. Functions that fall short get flagged as needing
/ annotation instead of being fuzzed against guessed argument types.

/ --------------------------------------------------
/ number of non-null arg codes in a fromFile-shaped signature row
/ (functionName + arg1..arg8) - reuses sim/'s own
/ .sim.exec.argCodesFromRow so "how many params does this annotation
/ cover" is answered the same way generate.q will later build args
/ from the same row
/ --------------------------------------------------
.testFramework.signature.annotatedArgCount:{[sigRow]
  count .sim.exec.argCodesFromRow sigRow
 };

/ --------------------------------------------------
/ classify one function's testability from its param count and its
/ (possibly null-filled) signature row
/ --------------------------------------------------
.testFramework.signature.status:{[paramCount;sigRow]
  $[0=paramCount; `niladic;
    paramCount>8; `tooManyParams;
    paramCount>.testFramework.signature.annotatedArgCount sigRow; `needsAnnotation;
    `annotated]
 };

/ --------------------------------------------------
/ resolve every function in a file to a testability status, left-
/ joining discover.q's function list against analyze/'s real
/ //@func/@param annotations (.analyze.sig.fromFile - not
/ suggestForFile, which only generates placeholder text, not usable
/ type codes). Functions with no annotation at all simply null-fill
/ through the join and fall out as `needsAnnotation below
/ --------------------------------------------------
.testFramework.signature.resolveForFile:{[filePath]
  discovered:.testFramework.discover.functionsInFile filePath;
  annotated:.analyze.sig.fromFile filePath;
  joined:discovered lj (`functionName xkey annotated);

  statuses:{[row] .testFramework.signature.status[row`paramCount;row]} each joined;

  / niladic rows get arg1 forced to 0 (general, the same placeholder
  / analyze/testFiles/testFile.q's own "//@param | [] | 0 | none"
  / annotations use) so sim/'s callBySig can invoke them uniformly
  / via .[fn;enlist(::)-like general arg;handler] - calling a lambda
  / through . apply with a truly empty () arg list raises a type
  / error whenever the lambda has an (even unused) implicit x, which
  / every bare "{" function - not just explicit "{[]" ones - has
  arg1Fixed:?[statuses=`niladic;0j;joined`arg1];

  ([] functionName:joined`functionName;
      functionLineNumber:joined`functionLineNumber;
      paramNames:joined`paramNames;
      paramCount:joined`paramCount;
      status:statuses;
      arg1:arg1Fixed; arg2:joined`arg2; arg3:joined`arg3; arg4:joined`arg4;
      arg5:joined`arg5; arg6:joined`arg6; arg7:joined`arg7; arg8:joined`arg8;
      suggestedText:joined`suggestedText)
 };
