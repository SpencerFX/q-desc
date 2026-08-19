/ ==================================================
/ scripts/help.q tests
/ ==================================================
/ .kdb.help is the single lookup entry point over everything the
/ other test topics already verify piecemeal (description, category,
/ example) - these are hand-crafted behavioral assertions against
/ known, verified-by-hand entries, not a generic capture-and-check.

/ --------------------------------------------------
/ unambiguous keyword lookup, with a category and a runnable example
/ --------------------------------------------------
.test.help.case.unambiguous:{[]
  rows:.kdb.help`avg;

  (
    .test.assert.equal["help avg - one match";count rows;1];
    .test.assert.equal["help avg - topic";first rows`topic;`keywords];
    .test.assert.equal["help avg - category";first rows`category;`math];
    .test.assert.true["help avg - has example";first rows`hasExample];
    .test.assert.true["help avg - example ran";first rows`exampleRan]
  )
 };

/ --------------------------------------------------
/ ambiguous symbol (b exists in both args and namespaceZ) - lists
/ every match, runs no examples, and does not error
/ --------------------------------------------------
.test.help.case.ambiguous:{[]
  rows:.kdb.help`b;

  (
    .test.assert.equal["help b - two matches";count rows;2];
    .test.assert.equal["help b - topics";asc rows`topic;`args`namespaceZ];
    .test.assert.true["help b - no example run while ambiguous";all not rows`exampleRan]
  )
 };

/ --------------------------------------------------
/ disambiguated (topic;symbol) pair resolves the same b symbol to
/ exactly one topic and runs its example
/ --------------------------------------------------
.test.help.case.disambiguated:{[]
  rows:.kdb.help(`namespaceZ;`b);

  (
    .test.assert.equal["help (namespaceZ;b) - one match";count rows;1];
    .test.assert.equal["help (namespaceZ;b) - topic";first rows`topic;`namespaceZ];
    .test.assert.true["help (namespaceZ;b) - example ran";first rows`exampleRan]
  )
 };

/ --------------------------------------------------
/ dotted real-name fallback (.Q.qt -> qt under namespaceQ) - natural
/ input for the topics whose actual q name is dotted
/ --------------------------------------------------
.test.help.case.dottedFallback:{[]
  rows:.kdb.help`$".Q.qt";

  (
    .test.assert.equal["help .Q.qt - one match";count rows;1];
    .test.assert.equal["help .Q.qt - topic";first rows`topic;`namespaceQ];
    .test.assert.true["help .Q.qt - example ran";first rows`exampleRan]
  )
 };

/ --------------------------------------------------
/ unknown symbol - no match, no error
/ --------------------------------------------------
.test.help.case.notFound:{[]
  rows:.kdb.help`totallyMadeUpSymbolThatDoesNotExist;
  enlist .test.assert.equal["help unknown symbol - zero matches";count rows;0]
 };

/ --------------------------------------------------
/ description exists but no example (part of the deliberately
/ deferred description/example backlog) - still resolves cleanly
/ --------------------------------------------------
.test.help.case.noExample:{[]
  rows:.kdb.help`flatFile;

  (
    .test.assert.equal["help flatFile - one match";count rows;1];
    .test.assert.equal["help flatFile - topic";first rows`topic;`tables];
    .test.assert.true["help flatFile - no example available";not first rows`hasExample];
    .test.assert.true["help flatFile - description still present";0<count first rows`description]
  )
 };

/ --------------------------------------------------
/ disambiguated pair for a topic the symbol doesn't actually belong
/ to - falls back to not-found rather than showing the wrong entry
/ --------------------------------------------------
.test.help.case.mismatchedPair:{[]
  rows:.kdb.help(`args;`avg);
  enlist .test.assert.equal["help (args;avg) - not a real combination";count rows;0]
 };
