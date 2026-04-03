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