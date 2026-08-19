/ ==================================================
/ testFramework run - top-level entry point
/ ==================================================

/ --------------------------------------------------
/ full pipeline for one file: discover -> resolve signatures ->
/ fuzz-execute what's safe to call. Splits the signature table into
/ tested functions (fed into generate.q) and skipped ones (status
/ `needsAnnotation or `tooManyParams), so callers get both a pass/fail
/ report and, for anything skipped, the suggested annotation text to
/ fix it (reusing discover.q's suggestedText, itself sourced from
/ analyze/'s own .analyze.sig.suggestForFile)
/ --------------------------------------------------
.testFramework.run.forFile:{[filePath]
  genResult:.testFramework.generate.casesForFile filePath;
  sigTbl:genResult`sigTbl;
  cases:genResult`cases;
  skipped:select functionName,functionLineNumber,paramCount,status,suggestedText
    from sigTbl where status in `needsAnnotation`tooManyParams;

  summary:([] metric:`total`passed`failed;
              metricValue:(count cases;sum cases`pass;sum not cases`pass));

  `filePath`sigTbl`cases`skipped`summary!(filePath;sigTbl;cases;skipped;summary)
 };

/ --------------------------------------------------
/ print a result for one file
/ --------------------------------------------------
.testFramework.run.show:{[filePath]
  resultDict:.testFramework.run.forFile filePath;
  show resultDict`cases;
  show resultDict`summary;
  if[0<count resultDict`skipped;
    -1 (string count resultDict`skipped)," function(s) skipped - see suggestedText to annotate them:";
    show resultDict`skipped
  ];
  resultDict
 };
