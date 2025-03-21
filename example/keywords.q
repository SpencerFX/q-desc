// INFO ====================================================
// Purpose: Show examples for key words
//==========================================================
/ Examples of keyword usage

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.keyword.abs[]
.kdb.exp.keyword.abs:{
 show "Example: abs";
 show "abs -1.0";
 show abs -1.0;
 show "abs(10;20 -30)";
 show abs(10;20 -30);
 };

// .kdb.exp.keyword.acos[]
.kdb.exp.keyword.acos:{
 show"acos usage";
 show"acos 0.1"
 show acos 0.1;
 };

// .kdb.exp.keyword.aj[]
.kdb.exp.keyword.aj:{
 show "example: aj - asof join - multithreaded primitive";
 show .kdb.desc.keywords.aj
 show "syntax is: aj[<col1,col2>;<table1>;<table2>]";
 show q:([]time:09:29 09:29 09:32 09:33;sym:`FD`KX`FD`KX;ask:30.23 40.20 30.35 40.35;bid:30.20 40.19 30.33 40.32);
 show t:([]time:09:30 09:31 09:32 09:33 09:34 09:35; sym:`FD`FD`KX`FD`KX`FD;price:30.43 30.45 40.45 30.55 41.00 31.00;size:100 200 200 300 300 600);
 show"aj[`sym`time;t;q]";
 show aj[`sym`time;t;q];
 show "Ensure the first argument to aj, the columns to search on, is in the correct order, e.g. `sym`time. Otherwise you'll suffer a severe performance hit.";
 show "memory -	g#	-   sorted within c1 -  quote has `g#sym and time sorted within sym";
 show "disk	 -  p#	-   sorted within c1 -	quote has `p#sym and time sorted within sym";
 };

// .kdb.exp.keyword.aj0[]
.kdb.exp.keyword.aj0:{
 show "example: aj0 - asof join - multithreaded primitive";
 show .kdb.desc.keywords.aj
 show "syntax is: aj0[<col1,col2>;<table1>;<table2>]";
 show q:([]time:09:29 09:29 09:32 09:33;sym:`FD`KX`FD`KX;ask:30.23 40.20 30.35 40.35;bid:30.20 40.19 30.33 40.32);
 show t:([]time:09:30 09:31 09:32 09:33 09:34 09:35; sym:`FD`FD`KX`FD`KX`FD;price:30.43 30.45 40.45 30.55 41.00 31.00;size:100 200 200 300 300 600);
 show"aj0[`sym`time;t;q]";
 show aj0[`sym`time;t;q];
 show "Ensure the first argument to aj, the columns to search on, is in the correct order, e.g. `sym`time. Otherwise you'll suffer a severe performance hit.";
 show "memory -	g#	-   sorted within c1 -  quote has `g#sym and time sorted within sym";
 show "disk	 -  p#	-   sorted within c1 -	quote has `p#sym and time sorted within sym";
 };

// .kdb.exp.keyword.all[]
.kdb.exp.keyword.all:{
 show "example: all (multi-threaded primitive)";
 show .kdb.desc.keywords.all;
 show "all null ([] c1:`a`b`c; c2:0n 0n 0n; c3:10 0N 30)";
 show all null ([] c1:`a`b`c; c2:0n 0n 0n; c3:10 0N 30);
 show "all 1 2 3=1 2 4";
 show all 1 2 3=1 2 4
 show "all 1 2 3=1 2 3";
 show all 1 2 3=1 2 3;
 show "all \"YNYN\" / string casts to 1111b";
 show all "YNYN";
 };

// .kdb.exp.keyword.any[]
.kdb.exp.keyword.any:{
 show "example: any (multi-threaded primitive)";
 show "syntax: any x    any[x]";
 show .kdb.desc.keywords.any;
 show "any 1 2 3=10 20 4";
 show any 1 2 3=10 20 4;
 show "any 1 2 3=1 20 30";
 show any 1 2 3=1 20 30;
 show "any \"YNYN\"";
 };

// .kdb.exp.keyword.asc[]
.kdb.exp.keyword.asc:{
 show "example: asc - ascending sort";
 show .kdb.desc.keywords.asc;
 show "asc 2 1 3 4 2 1 2";
 show asc 2 1 3 4 2 1 2;
 show "asc (1;1b;\"b\";2009.01.01;\"a\";0)";
 show asc (1;1b;"b";2009.01.01;"a";0);
 show "asc `a`b`c!2 1 3";
 show asc `a`b`c!2 1 3;
 show "asc ([]a:3 4 1;b:`a`d`s)";
 show asc ([]a:3 4 1;b:`a`d`s);
 };

// .kdb.exp.keyword.iasc[]
.kdb.exp.keyword.iasc:{
 show "example: iasc - ascending grade";
 show .kdb.desc.keywords.iasc;
 show "L:2 1 3 4 2 1 2";
 show L:2 1 3 4 2 1 2;
 show "iasc L";
 show iasc L;
 show "L iasc L";
 show L iasc L
 };

// .kdb.exp.keyword.xasc[]
.kdb.exp.keyword.xasc:{
 show "example: xasc - Sort a table in ascending order of specified columns.";
 show .kdb.desc.keywords.xasc;
 show "`city xasc s  / sort on city";
 show `city xasc s;
 show "`city`name xasc s / sort on city, and name within city";
 show `city`name xasc s;
 show "`status`city`name xasc `s / table given by reference, updated in place";
 show `status`city`name xasc `s;
 show "xasc can sort data on disk directly, without loading the entire table into memory.";
 show "`c xasc `:dat/t";
 };

// .kdb.exp.keyword.asin[]
.kdb.exp.keyword.asin:{
 show "example: asin";
 show .kdb.desc.keywords.asin;
 show "asin 0.8";
 show asin 0.8;
 show "Has implicit iterations as they are atomic functions.";
 show "asin (.2;.3 .4)";
 show asin (.2;.3 .4);
 };

// .kdb.exp.keyword.atan[]
.kdb.exp.keyword.atan:{
 show "example: atan";
 show .kdb.desc.keywords.atan;
 show "atan 0.8";
 show atan 0.8;
 show "Has implicit iterations as they are atomic functions.";
 show "atan (.2;.3 .4)";
 show atan (.2;.3 .4);
 };

// .kdb.exp.keyword.attr[]
.kdb.exp.keyword.attr:{
 show "example: attr - attributes of an object";
 show .kdb.desc.keywords.attr;
 show "attr 1 3 4";
 show attr 1 3 4;
 show "attr asc 1 3 4";
 show attr asc 1 3 4;
 };

// .kdb.exp.keyword.avg[]
.kdb.exp.keyword.avg:{
 show "example: avg";
 show .kdb.desc.keywords.avg;
 show "avg 1 2 3";
 show avg 1 2 3;
 show "avg (1 2;0N 4)  / nested: null items are preserved";
 show avg (1 2;0N 4);
 show "avg is an aggregate function, equivalent to {sum[x]%count x}.";
 show "select ap:avg price by sym from trade";
 show select ap:avg price by sym from trade;
 };

// .kdb.exp.keyword.avgs[]
.kdb.exp.keyword.avgs:{
 show "example: avgs";
 show .kdb.desc.keywords.avgs;
 show "avgs 1 2 3 0n 4 -0w 0w";
 show avgs 1 2 3 0n 4 -0w 0w;
 };

// .kdb.exp.keyword.bin[]
.kdb.exp.keyword.bin:{
 show "example: bin";
 show .kdb.desc.keywords.bin;
 show "0 2 4 6 8 10 bin 5";
 show 0 2 4 6 8 10 bin 5;
 show "r[i]=-1          iff y[i]<x[0]";
 show "r[i]=j           iff last j such that x[j]<=y[i]<=x[j+1]";
 show "r[i]=n-1           iff x[n-1]<=y[i]";
 show "bin detects the special case of three columns with the third column having a sorted attribute. The search is initially constrained by the first column, then by the sorted third column, and then by a linear search through the remaining second column. The performance difference is visible in this example:"
 show "n:1000000;t:([]a:`p#asc n?`2;b:`#asc n?1000;c:asc n?100000)";
 show n:1000000;t:([]a:`p#asc n?`2;b:`#asc n?1000;c:asc n?100000);
 t bin t;
 };

// .kdb.exp.keyword.binr[]
.kdb.exp.keyword.binr:{
 show "example: bin";
 show .kdb.desc.keywords.bin;
 show "0 2 4 6 8 10 bin 5";
 show 0 2 4 6 8 10 bin 5;
 show "r[i]=-1          iff y[i]<x[0]";
 show "r[i]=j           iff last j such that x[j]<=y[i]<=x[j+1]";
 show "r[i]=n-1           iff x[n-1]<=y[i]";
 show "bin detects the special case of three columns with the third column having a sorted attribute. The search is initially constrained by the first column, then by the sorted third column, and then by a linear search through the remaining second column. The performance difference is visible in this example:"
 show "n:1000000;t:([]a:`p#asc n?`2;b:`#asc n?1000;c:asc n?100000)";
 show n:1000000;t:([]a:`p#asc n?`2;b:`#asc n?1000;c:asc n?100000);
 t bin t;
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.raze[]
.kdb.exp.keyword.raze:{
    show ".kdb.exp.keyword.raze";
    show raze (1 2; 3 4 5);
    b:(1 2;(3 4;5 6);7;8);
    show ".kdb.exp.keyword.raze with multiple levels";
    show b;
    show raze/[b];
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.
 
 };

// .kdb.exp.keyword.[]
.kdb.exp.keyword.:{
 show "example: ";
 show .kdb.desc.keywords.

 };
