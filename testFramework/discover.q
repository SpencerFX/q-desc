/ ==================================================
/ testFramework discover functions
/ ==================================================
/ Finds every function defined in a file. This is a thin wrapper
/ around analyze/'s own .analyze.sig.suggestForFile rather than a
/ second copy of its function-boundary-scanning loop: that function
/ already walks the file with .analyze.categorize.isFunctionStart/
/ functionNameFromLine/paramNamesFromLine (which correctly handle
/ both the explicit "{[x]" style and the bare "{" style every real
/ example function uses) and returns exactly the columns needed here.
/ Building a duplicate scanner would risk the exact "two things doing
/ the same job drift apart" problem analyze/'s own history already
/ ran into twice (categorize.q's catalog vs discover.q's, and
/ discover.q's legacy per-category functions vs its catalog-driven
/ .all).

/ --------------------------------------------------
/ every function defined in filePath, with its parameter names/count
/ --------------------------------------------------
.testFramework.discover.functionsInFile:{[filePath]
  suggestTbl:.analyze.sig.suggestForFile filePath;

  ([] functionName:suggestTbl`functionName;
      functionLineNumber:suggestTbl`functionLineNumber;
      paramNames:suggestTbl`paramNames;
      paramCount:count each suggestTbl`paramNames;
      suggestedText:suggestTbl`suggestedText)
 };
