/ ==================================================
/ run every test suite and aggregate pass/fail
/ ==================================================
/ Must be run from the repo root, same as every individual runX.q,
/ since each one resolves its own relative paths (scripts/init.q,
/ description/, etc.) against the current working directory.
/ -
/ Each runX.q is loaded via system "l ..." rather than spawned as a
/ separate q.exe process: nested q-inside-q process spawning proved
/ unreliable in testing here (the child produces no output and no
/ error even outside of any sandboxing, most likely a single-instance
/ license restriction on this seat) - sequential in-process loading
/ is the reliable equivalent and gives the same "one command instead
/ of seven" result. Each runX.q only ever assigns the same few
/ globals (allResults, summary, ...), so reloading it just overwrites
/ them - there's no cross-suite state to leak. A trap around each
/ load still isolates suites from each other in case one errors
/ outright.
/ -
/ Loading the example/ scripts as a side effect of each runX.q prints
/ a lot of demo output to stdout (that's how those scripts are meant
/ to be used standalone, and is unrelated to this runner). To keep
/ the report readable, stdout is redirected to a scratch log file for
/ the duration of the run, and this script's own progress/report
/ lines go to stderr instead (via -2), which stays attached to the
/ console throughout - reverting a stdout redirect back to the
/ console isn't supported on this q build, so this sidesteps that
/ entirely rather than fighting it.

/ --------------------------------------------------
/ topic -> runner script path
/ --------------------------------------------------
.testAll.runners:([]
  topic: `keywords`joins`iterators`overloads`dataTypes`tables`args`namespaceJ`namespaceQ`namespaceZ`internals`analyze`consistency;
  script:("tests/runKeywords.q";"tests/runJoins.q";"tests/runIterators.q";"tests/runOverloads.q";"tests/runDataTypes.q";"tests/runTables.q";"tests/runArgs.q";"tests/runNamespaceJ.q";"tests/runNamespaceQ.q";"tests/runNamespaceZ.q";"tests/runInternals.q";"tests/runAnalyze.q";"tests/runConsistency.q")
 );

/ --------------------------------------------------
/ where each suite's swallowed console noise is logged
/ --------------------------------------------------
.testAll.logPath:{[]
  tempDir:getenv `TEMP;
  dir:$[0=count tempDir;".";tempDir];
  dir,"/q-desc-runAll.log"
 }[];

/ --------------------------------------------------
/ print a (possibly multi-line) console-formatted value to stderr
/ --------------------------------------------------
.testAll.printErr:{[x]
  lines:"\n" vs .Q.s x;
  {-2 x} each lines;
 };

/ --------------------------------------------------
/ load one runner script and read back its summary table as a dict
/ --------------------------------------------------
.testAll.loadAndSummarize:{[scriptPath]
  system "l ",scriptPath;
  exec metric!metricValue from summary
 };

/ --------------------------------------------------
/ run one topic, trapping any error so one bad suite doesn't abort the rest
/ --------------------------------------------------
.testAll.runOne:{[topicName;scriptPath]
  result:.[.testAll.loadAndSummarize;enlist scriptPath;{x}];
  crashed:10h=type result;
  status:$[crashed;`crashed;$[0=result`failed;`pass;`fail]];

  `topic`script`status`total`passed`failed`errMsg!(
    topicName;
    scriptPath;
    status;
    $[crashed;0Nj;result`total];
    $[crashed;0Nj;result`passed];
    $[crashed;0Nj;result`failed];
    $[crashed;result;""]
  )
 };

/ --------------------------------------------------
/ run every configured topic and return the results table
/ --------------------------------------------------
.testAll.runAll:{[]
  results:();
  i:0;
  n:count .testAll.runners;

  while[i<n;
    row:.testAll.runners i;
    -2 "running ",(string row`topic)," (",(row`script),")...";
    results,:enlist .testAll.runOne[row`topic;row`script];
    i+:1
  ];

  results
 };

/ --------------------------------------------------
/ print a per-topic report plus a grand total, and print the error
/ message for any suite that crashed outright
/ --------------------------------------------------
.testAll.report:{[results]
  reportTbl:([] topic:results`topic; status:results`status; total:results`total; passed:results`passed; failed:results`failed);
  .testAll.printErr reportTbl;

  ok:results where results[`status]=`pass;
  grand:([] metric:`suites`total`passed`failed;
            metricValue:(
              count results;
              sum ok`total;
              sum ok`passed;
              sum ok`failed));
  .testAll.printErr grand;

  i:0;
  n:count results;
  while[i<n;
    row:results i;
    if[row[`status]=`crashed;
      -2 "";
      -2 "--- ",(string row`topic)," crashed: ",row`errMsg;
    ];
    i+:1
  ];
 };

/ --------------------------------------------------
/ run everything, keeping each suite's demo/example console noise out
/ of the way, and report to stderr
/ --------------------------------------------------
-2 "suite noise redirected to ",.testAll.logPath;
system "1 ",.testAll.logPath;

allResults:.testAll.runAll[];
.testAll.report[allResults];

anyFailed:any not allResults[`status] in enlist `pass;
if[anyFailed;
  -2 "";
  -2 "one or more suites did not pass";
  exit 1
 ];

-2 "";
-2 "all suites passed";
