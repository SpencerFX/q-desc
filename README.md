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

`description/`, `dictionary/`, `data/`, and `example/` are flat directories loaded via
`.kdb.init`, which takes an absolute path and works from any working directory:

```q
\l scripts/init.q
.kdb.init["/path/to/q-desc/description"]
.kdb.init["/path/to/q-desc/dictionary"]
.kdb.init["/path/to/q-desc/data"]
.kdb.init["/path/to/q-desc/example"]
```

`analyze/`, `sim/`, and `tests/` have their own init/runner scripts instead, and load
their files via relative paths — start q with the repo root as the working directory
first, then:

```q
\l analyze/init.q      / loads + initializes the script-analysis tooling
\l sim/init.q           / loads the data simulator
\l tests/runJoins.q     / runs the join test suite (also: runIterators.q, runKeywords.q, runOverloads.q, runDataTypes.q, runTables.q)
```

## Usage

Once `description`/`dictionary`/`example` are loaded, look up or run anything by category and name:

```q
/ read a description directly
.kdb.desc.joins.aj

/ or via the dictionary (symbol -> description text)
.kdb.dict.joins`aj
key .kdb.dict.joins        / list every join documented under this category

/ run the matching worked example (prints sample data + the operation + its result)
.kdb.exp.joins.aj[]
```

The same pattern applies across every category — `dataTypes`, `errors`, `internals`,
`iterators`, `joins`, `keywords`, `namespaceJ`, `namespaceQ`, `namespaceZ`, `overloads`,
`tables` — via `.kdb.desc.<category>.<name>`, `.kdb.dict.<category>`, and
`.kdb.exp.<category>.<name>[]` respectively.