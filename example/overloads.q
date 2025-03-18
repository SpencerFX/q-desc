// INFO ====================================================
// Purpose: Show examples for overloads
//==========================================================
/ Examples of overloads

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.overloads.find[]
.kdb.exp.overloads.find:{
 show"Example: Overloads - ? - find";
 show .kdb.desc.overloads.find;
 w:10 -8 3 5 -2 3;
 show w;
 show"w?-8";
 show w?-8;
 };

// .kdb.exp.overloads.roll[]
.kdb.exp.overloads.roll:{
 show"Example: Overloads - ? - roll";
 show .kdb.desc.overloads.roll;
 show"10?5 / roll 10 (5 sided dice)"
 show 10?5;
 show"-5?20 / deal 5";
 show -5?20;
 };

// .kdb.exp.overloads.permute[]
.kdb.exp.overloads.permute:{
 show"Example: Overloads - ? - permute";
 show .kdb.desc.overloads.permute;
 show"0N?10;"
 show 0N?10;
 show "0N?string `abc";
 show 0N?string `abc;
 };

// .kdb.exp.overloads.enumExtend[]
.kdb.exp.overloads.enumExtend:{
 show"Example: Overloads - ? - Enum Extend";
 show .kdb.desc.overloads.enumExtend;
 show"foo:`a`b";
 show foo:`a`b;
 show "`foo?`a`b`c`b`a`b`c`c`c`c`c`c`";
 show `foo?`a`b`c`b`a`b`c`c`c`c`c`c`;
 };

// .kdb.exp.overloads.vectorCondtional[]
.kdb.exp.overloads.vectorCondtional:{
 show"Example: Overloads - ? - Vector Coonditional";
 show .kdb.desc.overloads.vectorConditional;
 show"?[11001b;1 2 3 4 5;10 20 30 40 50]";
 show ?[11001b;1 2 3 4 5;10 20 30 40 50];
 };

// .kdb.exp.overloads.simpleExec[]
.kdb.exp.overloads.simpleExec:{
 show"Example: Overloads - ? - Simple Exec";
 show .kdb.desc.overloads.simpleExec;
 show "t:([]a:1 2 3;b:4 5 6;c:7 9 0)";
 show t:([]a:1 2 3;b:4 5 6;c:7 9 0);
 show "?[t;0 1 2;`a]";
 show ?[t;0 1 2;`a];
 show "?[t;0 1 2;(*;(min;`a);(avg;`c))]";
 show ?[t;0 1 2;(*;(min;`a);(avg;`c))];
 };

// .kdb.exp.overloads.select[]
.kdb.exp.overloads.select:{
 show"Example: Overloads - ? - select";
 show .kdb.desc.overloads.select;
 show "t:([] c1:`a`b`c`a; c2:10 20 30 40)";
 show t:([] c1:`a`b`c`a; c2:10 20 30 40);
 show "?[t;();0b;();-2] / select[-2] from t";
 show ?[t;();0b;();-2];
 show "?[t;();0b;();1 2] / select[1 2] from t"
 show ?[t;();0b;();1 2];
 show "?[t; (); 0b; `c1`c2!`c1`c2; 0W; (idesc;`c1)]";
 show ?[t; (); 0b; `c1`c2!`c1`c2; 0W; (idesc;`c1)]
 };

// .kdb.exp.overloads.indexAt[]
.kdb.exp.overloads.indexAt:{
 show"Example: Overloads - @ - index at";
 show .kdb.desc.overloads.indexAt;
 show "d:((1 2 3;4 5 6 7) ;(8 9;10;11 12) ;(13 14;15 16 17 18;19 20))";
 show d:((1 2 3;4 5 6 7) ;(8 9;10;11 12) ;(13 14;15 16 17 18;19 20));
 show "((d @ 1) @ 2) @ 0 ";
 show ((d @ 1) @ 2) @ 0;
 show "d @/ 1 2 0 ";
 show d @/ 1 2 0 ;
 };

// .kdb.exp.overloads.applyAt[]
.kdb.exp.overloads.applyAt:{
 show"Example: Overloads - @ - apply at";
 show .kdb.desc.overloads.applyAt;
 show "{`o`h`l`c!(first;max;min;last)@(backslash):x}1 2 3 4 22";
 show {`o`h`l`c!(first;max;min;last)@\:x}1 2 3 4 22;
 };

// .kdb.exp.overloads.trapAt[]
.kdb.exp.overloads.trapAt:{
 show"Example: Overloads - @ - trap at";
 show .kdb.desc.overloads.trapAt;
 show"@[2+;\"42\";`err]";
 show @[2+;"42";`err];
 };

// .kdb.exp.overloads.amendAt[]
.kdb.exp.overloads.amendAt:{
 show"Example: Overloads - @ - amend at";
 show .kdb.desc.overloads.amendAt;
 show "@[(0 1 2;1 2 3 4;7 8 9) ;1 1; 2*]";
 show @[(0 1 2;1 2 3 4;7 8 9) ;1 1; 2*];
 show "@[(0 1 2;1 2 3 4;7 8 9) ;0 1 2 1; 100*]";
 show @[(0 1 2;1 2 3 4;7 8 9) ;0 1 2 1; 100*];
 };

// .kdb.exp.overloads.replaceAt[]
.kdb.exp.overloads.replaceAt:{
 show"Example: Overloads - @ - replace at";
 show .kdb.desc.overloads.replaceAt;
 show "d:((1 2 3; 4 5 6 7);(8 9; 10; 11 12);(13 14; 15 16 17 18; 19 20))";
 d:((1 2 3; 4 5 6 7);(8 9; 10; 11 12);(13 14; 15 16 17 18; 19 20));
 i:(2 0; 0 1 0);
 y: (100 200 300; 400 500 600);
 show "@[d; i; :; y]";
 show @[d; i; :; y]
 };

// .kdb.exp.overloads.dotIndex[]
.kdb.exp.overloads.dotIndex:{
 show"Example: Overloads - . - index";
 show .kdb.desc.overloads.dotIndex;
 show add:((0 1 2 3);(1 2 3 4);(2 3 4 5);(3 4 5 6));
 show add;
 show "add . 2 3";
 show add . 2 3
 };

// .kdb.exp.overloads.dotApply[]
.kdb.exp.overloads.dotApply:{
 show"Example: Overloads - . - apply";
 show .kdb.desc.overloads.dotApply;
 show "(+) . 2 3";
 show (+) . 2 3;
 };

// .kdb.exp.overloads.dotTrap[]
.kdb.exp.overloads.dotTrap:{
 show"Example: Overloads - . - trap";
 show .kdb.desc.overloads.dotTrap;
 show ".[+;\"ab\";`ouch]";
 show .[+;"ab";`ouch];
 show ".[+;\"ab\";{\"Wrong \",x}]";
 show .[+;"ab";{"Error message: ",x}]
 };

// .kdb.exp.overloads.dotAmend[]
.kdb.exp.overloads.dotAmend:{
 show"Example: Overloads - . - amend";
 show .kdb.desc.overloads.dotAmend;
 show ".[1 2; (); 3 4 5]";
 show .[1 2; (); 3 4 5];
 };

// .kdb.exp.overloads.dotReplace[]
.kdb.exp.overloads.dotReplace:{
 show"Example: Overloads - . - Replace";
 show .kdb.desc.overloads.dotReplace;
 d:((1 2 3; 4 5 6 7);(8 9; 10; 11 12);(13 14; 15 16 17 18; 19 20));
 show d;
 show i:(2 0; 0 1 0);
 show toReplace:(100 200 300; 400 500 600);
 show ".[d; i; :; toReplace]";
 show r:.[d; i; :; toReplace];
 };

// .kdb.exp.overloads.cond[]
.kdb.exp.overloads.cond:{
 show"Example: Overloads - $ - cond";
 show .kdb.desc.overloads.cond;
 show "$[0b;`true;`false]";
 show $[0b;`true;`false];
 show "$[1b;`true;`false]";
 show $[1b;`true;`false];
 };

// .kdb.exp.overloads.cast[]
.kdb.exp.overloads.cast:{
 show"Example: Overloads - $ - cast";
 show .kdb.desc.overloads.cast;
 show "`$\"aString\"";
 show `$"aString";
 };

// .kdb.exp.overloads.tok[]
.kdb.exp.overloads.tok:{
 show"Example: Overloads - $ - tok";
 show .kdb.desc.overloads.tok;
 show "\"E\"$\"3.14\"";
 show "E"$"3.14";
 };

// .kdb.exp.overloads.enumerate[]
.kdb.exp.overloads.enumerate:{
 show"Example: Overloads - $ - enumerate";
 show .kdb.desc.overloads.enumerate;
 show "d:`a`b`c";
 show d:`a`b`c;
 show "y:`a`b`c`b`a`b`c`c`c`c`c`c`c";
 show w:`a`b`c`b`a`b`c`c`c`c`c`c`c;
 show "e:`d$w";
 show "must be done globally"
 };

// .kdb.exp.overloads.pad[]
.kdb.exp.overloads.pad:{
 show"Example: Overloads - $ - pad";
 show .kdb.desc.overloads.pad;
 show "9$\"foo\"";
 show 9$"foo";
 show "-9$\"foo\"";
 show -9$"foo";
 };