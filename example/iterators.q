// INFO ====================================================
// Purpose: Show examples for iterators
//==========================================================
/ Examples of iterators

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.iterators.case[]
.kdb.exp.iterators.case:{
 show "Example: Iterators - case";
 show .kdb.desc.iterators.case;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"0 1 0'[\"abc\";\"xyz\"]";
 show 0 1 0'["abc";"xyz"];
 show"i:0 1 0 2";
 show i:0 1 0 2;
 show"i,'til count i";
 show i,'til count i
 };

// .kdb.exp.iterators.cross[]
// Note: to update this later
.kdb.exp.iterators.cross:{
 show "Example: Iterators - cross";
 show .kdb.desc.iterators.cross;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show 1 2 3,/:\:10 20
 };

// .kdb.exp.iterators.each[]
.kdb.exp.iterators.each:{
 show "Example: Iterators - each";
 show .kdb.desc.iterators.each;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"m:5 cut til 25";
 show m:5 cut til 25;
 show"type each m";
 show type each m
 };

// .kdb.exp.iterators.eachLeft[]
.kdb.exp.iterators.eachLeft:{
 show "Example: Iterators - each left";
 show .kdb.desc.iterators.eachLeft;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"m:5 cut til 25";
 show m:5 cut til 25;
 show"type each m";
 type each m
 };

// .kdb.exp.iteratorseachParallel[]
.kdb.exp.iterators.eachParallel:{
 show "Example: Iterators - each parallel";
 show .kdb.desc.iterators.eachParallel;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"q -s 2";
 show"inv peach 2 1000 1000#2000000?1f";
 };

// .kdb.exp.iterators.eachPrior[]
.kdb.exp.iterators.eachPrior:{
 show "Example: Iterators - each prior";
 show .kdb.desc.iterators.eachPrior;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"+':[1 2 3]";
 show +':[1 2 3];
 };

// .kdb.exp.iterators.eachRight[]
.kdb.exp.iterators.eachRight:{
 show "Example: Iterators - each right";
 show .kdb.desc.iterators.eachRight;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"v:(\"one\";\"two\";\"three\")";
 show v:("one";"two";"three");
 show"\"twenty-\",/:v";
 show"twenty-",/:v;
 };

// .kdb.exp.iterators.over[]
.kdb.exp.iterators.over:{
 show "Example: Iterators - over";
 show .kdb.desc.iterators.over;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"(+) over 1 2 3 4 5";
 show (+) over 1 2 3 4 5;
 };

// .kdb.exp.iterators.peach[]
.kdb.exp.iterators.peach:{
 show "Example: Iterators - peach";
 show .kdb.desc.iterators.eachParallel;
 show .kdb.desc.iterators.peach;
 show"q -s 2";
 show"inv peach 2 1000 1000#2000000?1f";
 };

// .kdb.exp.iterators.scan[]
.kdb.exp.iterators.scan:{
 show "Example: Iterators - scan";
 show .kdb.desc.iterators.scan;
 // show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show"(+) scan 1 2 3 4 5";
 show (+) scan 1 2 3 4 5;
 show"max scan 3 1 4 2 5";
 show max scan 3 1 4 2 5
 };