/ ==================================================
/ analyze classify functions
/ ==================================================

/ --------------------------------------------------
/ classify discovered test suite names
/ --------------------------------------------------
.analyze.classify.testSuites:{[discoverDict]
  iteratorSuites:$[0<count discoverDict`iterators; enlist `runIterators; `symbol$()];
  joinSuites:$[0<count discoverDict`joins; enlist `runJoins; `symbol$()];
  overloadSuites:$[0<count discoverDict`overloads; enlist `runOverloads; `symbol$()];

  distinct raze (iteratorSuites;joinSuites;overloadSuites)
 };

/ --------------------------------------------------
/ classify discovered use cases into table
/ --------------------------------------------------
.analyze.classify.useCases:{[discoverDict]
  iteratorRows:([] category:`symbol$();useCase:`symbol$();testSuite:`symbol$());
  joinRows:([] category:`symbol$();useCase:`symbol$();testSuite:`symbol$());
  overloadRows:([] category:`symbol$();useCase:`symbol$();testSuite:`symbol$());

  if[0<count discoverDict`iterators;
    iteratorRows:([] category:(count discoverDict`iterators)#`iterator;useCase:discoverDict`iterators;testSuite:(count discoverDict`iterators)#`runIterators)
  ];

  if[0<count discoverDict`joins;
    joinRows:([] category:(count discoverDict`joins)#`join;useCase:discoverDict`joins;testSuite:(count discoverDict`joins)#`runJoins)
  ];

  if[0<count discoverDict`overloads;
    overloadRows:([] category:(count discoverDict`overloads)#`overload;useCase:discoverDict`overloads;testSuite:(count discoverDict`overloads)#`runOverloads)
  ];

  raze (iteratorRows;joinRows;overloadRows)
 };