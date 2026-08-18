# q-desc

A q/kdb+ reference library for descriptions, categories, and runnable examples of q syntax and common operations.

## What this repo contains

- `description/` — prose descriptions of q keywords, joins, tables, and related concepts  
- `dictionary/` — symbol-to-description dictionaries and category mappings  
- `example/` — runnable example functions  
- `data/` — supporting sample data used by examples  
- `scripts/` — initialization and helper scripts  
- `tests/` — structured test framework for validating q behavior  
- `analyze/` — utilities for analyzing q scripts and mapping operations  

---

## Quick start

```q
\l scripts/init.q
.kdb.init["/path/to/q-desc/description"]
.kdb.init["/path/to/q-desc/dictionary"]
.kdb.init["/path/to/q-desc/data"]
.kdb.init["/path/to/q-desc/example"]
```

---

## Running the tests

Every topic has its own runner under `tests/` (`runKeywords.q`, `runJoins.q`, `runIterators.q`, `runOverloads.q`, `runDataTypes.q`, `runTables.q`, `runArgs.q`, `runNamespaceJ.q`, `runNamespaceQ.q`, `runNamespaceZ.q`, `runInternals.q`). Each one loads the relevant `description/`, `dictionary/`, `data/`, and `example/` content, executes every example function for that topic, and prints a pass/fail summary. Run any one directly, from the repo root:

```q
q tests/runKeywords.q -q
```

To run everything at once, use `tests/runAll.q`:

```q
q tests/runAll.q -q
```

This runs all topic suites plus a `consistency` suite (`tests/runConsistency.q`) that checks `description/`, `dictionary/`, and `example/` stay wired together: every description has a matching dictionary entry and a runnable example, and no dictionary key silently points at the wrong description. Each suite's own example output is redirected to a log file so the aggregate report stays readable; the log's location is printed at the start of the run. `runAll.q` exits `0` if every suite passes and `1` otherwise, so it's safe to use as a gate in a script or CI job.