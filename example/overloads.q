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