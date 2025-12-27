// INFO ====================================================
// Purpose: Show examples for key words
//==========================================================
/ Examples of keyword usage

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.keywords.abs[]
.kdb.exp.keywords.abs:{
 show "Example: abs";
 show "abs -1.0";
 show abs -1.0;
 show "abs(10;20 -30)";
 show abs(10;20 -30);
 };

// .kdb.exp.keywords.acos[]
.kdb.exp.keywords.acos:{
 show"acos usage";
 show"acos 0.1"
 show acos 0.1;
 };

// .kdb.exp.keywords.aj[]
.kdb.exp.keywords.aj:{
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

// .kdb.exp.keywords.aj0[]
.kdb.exp.keywords.aj0:{
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

// .kdb.exp.keywords.all[]
.kdb.exp.keywords.all:{
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

// .kdb.exp.keywords.any[]
.kdb.exp.keywords.any:{
 show "example: any (multi-threaded primitive)";
 show "syntax: any x    any[x]";
 show .kdb.desc.keywords.any;
 show "any 1 2 3=10 20 4";
 show any 1 2 3=10 20 4;
 show "any 1 2 3=1 20 30";
 show any 1 2 3=1 20 30;
 show "any \"YNYN\"";
 };

// .kdb.exp.keywords.asc[]
.kdb.exp.keywords.asc:{
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

// .kdb.exp.keywords.iasc[]
.kdb.exp.keywords.iasc:{
 show "example: iasc - ascending grade";
 show .kdb.desc.keywords.iasc;
 show "L:2 1 3 4 2 1 2";
 show L:2 1 3 4 2 1 2;
 show "iasc L";
 show iasc L;
 show "L iasc L";
 show L iasc L
 };

// .kdb.exp.keywords.xasc[]
.kdb.exp.keywords.xasc:{
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

// .kdb.exp.keywords.asin[]
.kdb.exp.keywords.asin:{
 show "example: asin";
 show .kdb.desc.keywords.asin;
 show "asin 0.8";
 show asin 0.8;
 show "Has implicit iterations as they are atomic functions.";
 show "asin (.2;.3 .4)";
 show asin (.2;.3 .4);
 };

// .kdb.exp.keywords.atan[]
.kdb.exp.keywords.atan:{
 show "example: atan";
 show .kdb.desc.keywords.atan;
 show "atan 0.8";
 show atan 0.8;
 show "Has implicit iterations as they are atomic functions.";
 show "atan (.2;.3 .4)";
 show atan (.2;.3 .4);
 };

// .kdb.exp.keywords.attr[]
.kdb.exp.keywords.attr:{
 show "example: attr - attributes of an object";
 show .kdb.desc.keywords.attr;
 show "attr 1 3 4";
 show attr 1 3 4;
 show "attr asc 1 3 4";
 show attr asc 1 3 4;
 };

// .kdb.exp.keywords.avg[]
.kdb.exp.keywords.avg:{
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

// .kdb.exp.keywords.avgs[]
.kdb.exp.keywords.avgs:{
 show "example: avgs";
 show .kdb.desc.keywords.avgs;
 show "avgs 1 2 3 0n 4 -0w 0w";
 show avgs 1 2 3 0n 4 -0w 0w;
 };

// .kdb.exp.keywords.bin[]
.kdb.exp.keywords.bin:{
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

// .kdb.exp.keywords.binr[]
.kdb.exp.keywords.binr:{
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

// .kdb.exp.keywords.ceiling[]
.kdb.exp.keywords.ceiling:{
 show "example: ceiling - round up";
 show .kdb.desc.keywords.ceiling;
 show "ceiling -2.1 0 2.1";
 show ceiling -2.1 0 2.1;
 show "ceiling is an atomic function with implicit iteration";
 show "ceiling`a`b!(1.2;3.4 5.6)";
 show ceiling`a`b!(1.2;3.4 5.6);
 };

// .kdb.exp.keywords.cols[]
.kdb.exp.keywords.cols:{
 show "example: cols - column names of a table";
 show .kdb.desc.keywords.cols;
 show "cols trade";
 show cols trade;
 };

// .kdb.exp.keywords.cor[]
.kdb.exp.keywords.cor:{
 show "example: cor - correlation";
 show .kdb.desc.keywords.core;
 show "29 10 54 cor 1 3 9";
 show 29 10 54 cor 1 3 9;
 show "10 29 54 cor 1 3 9";
 show 10 29 54 cor 1 3 9;
 };

// .kdb.exp.keywords.cos[]
.kdb.exp.keywords.cos:{
 show "example: cos - cosine";
 show .kdb.desc.keywords.cosine;
 show "cos 0.2";
 show cos 0.2;
 show "cos is an atomic function with implicit iteration";
 show "cos (.2;.3 .4)";
 show cos (.2;.3 .4);
 };

// .kdb.exp.keywords.count[]
.kdb.exp.keywords.count:{
 show "example: count - count the items of a list or dictionary";
 show .kdb.desc.keywords.count;
 show count 0   / atom
 count "zero"  / vector
 count (2;3 5;"eight")  / mixed list
 RaggedArray:(1 2 3;4 5;6 7 8 9;0);
 show count RaggedArray;
 show count each RaggedArray;
 };

// .kdb.exp.keywords.cov[]
.kdb.exp.keywords.cov:{
 show "example: cov - covariance";
 show .kdb.desc.keywords.cov;
 // show "2 3 5 7 cov 3 3 5 9";
 // show 2 3 5 7 cov 3 3 5 9;
 show "select price cov size by sym from trade";
 show select price cov size by sym from trade;
 };

// .kdb.exp.keywords.cross[]
.kdb.exp.keywords.cross:{
 show "example: cross - returns the cross pdocut of x and y.";
 show .kdb.desc.keywords.cross;
 show "1 2 3 cross 10 20";
 show 1 2 3 cross 10 20;
 show "(cross/)(2 3;10;\"abc\")";
 show (cross/)(2 3;10;"abc");
 };

// .kdb.exp.keywords.cut[]
.kdb.exp.keywords.cut:{
 show "example: cut - cut a list or table into a matrix of x columns.";
 show .kdb.desc.keywords.cut;
 show "4 cut til 10";
 show 4 cut til 10;
 show "Otherwise cut behaves as _ Cut.";
 };

// .kdb.exp.keywords.delete[]
.kdb.exp.keywords.delete:{
 show "example: delete";
 show .kdb.desc.keywords.delete;
 show "d:`a`b`c!til 3";
 show d:`a`b`c!til 3;
 show "delete b from `d";
 delete b from `d;
 show d
 };

// .kdb.exp.keywords.deltas[]
.kdb.exp.keywords.deltas:{
 show "example: deltas - Differences between adjacent list items";
 show .kdb.desc.keywords.deltas;
 show "deltas 1 4 9 16";
 show deltas 1 4 9 16;
 show "update diff:deltas price by sym from trade";
 show update diff:deltas price by sym from trade;
 show "With signum to count the number of up/down/same ticks:";
 show "select count i by signum deltas price from trade";
 show select count i by signum deltas price from trade;
 };

// .kdb.exp.keywords.desc[]
.kdb.exp.keywords.desc:{
 show "example: desc - descending sort";
 show .kdb.desc.keywords.desc;
 show "desc  2 1 3 4 2 1 2";
 show desc  2 1 3 4 2 1 2;
 show "desc (1;1b;\"b\";2009.01.01;\"a\";0)";
 show desc (1;1b;"b";2009.01.01;"a";0);
 show "desc `a`b`c!2 1 3";
 show desc `a`b`c!2 1 3;
 show "desc([]a:3 4 1;b:`a`d`s)";
 show desc([]a:3 4 1;b:`a`d`s);
 show "meta desc([]a:3 4 1;b:`a`d`s)";
 show meta desc([]a:3 4 1;b:`a`d`s);
 };

// .kdb.exp.keywords.idesc[]
.kdb.exp.keywords.idesc:{
 show "example: idesc - descending grade";
 show .kdb.desc.keywords.idesc;
 show "L:2 1 3 4 2 1 2";
 show L:2 1 3 4 2 1 2;
 show "idesc L";
 show idesc L;
 show "L idesc L";
 show L idesc L;
 show "idesc `a`c`b!1 2 3";
 show idesc `a`c`b!1 2 3;
 };

// .kdb.exp.keywords.xdesc[]
.kdb.exp.keywords.xdesc:{
 show "example: xdesc";
 show .kdb.desc.keywords.xdesc;
 show "xdesc can sort data on disk directly, without loading the entire table into memory: see xasc.";
 show s;
 show "`city xdesc s";
 show `city xdesc s; 
 };

// .kdb.exp.keywords.dev[]
.kdb.exp.keywords.dev:{
 show "example: dev - standard deviation - {sqrt var x}";
 show .kdb.desc.keywords.dev;
 show "dev 10 343 232 55";
 show dev 10 343 232 55;
 show "Since 4.1t 2022.04.15, can also traverse columns of tables and general/anymap/nested lists.";
 };

// .kdb.exp.keywords.mdev[]
.kdb.exp.keywords.mdev:{
 show "example: mdev - moving deviations";
 show .kdb.desc.keywords.mdev;
 show "2 mdev 1 2 3 5 7 10";
 show 2 mdev 1 2 3 5 7 10;
 show "5 mdev 0N 2 0N 5 7 0N    / nulls after the first are replaced by 0";
 show 5 mdev 0N 2 0N 5 7 0N;
 show "mdev applies to dictionaries and tables";
 show "k:`k xkey update k:`abc`def`ghi from t:flip d:`a`b!(10 21 3;4 5 6)";
 show k:`k xkey update k:`abc`def`ghi from t:flip d:`a`b!(10 21 3;4 5 6);
 show "2 mdev d";
 show 2 mdev d
 show "2 mdev t";
 show 2 mdev t;
 };

// .kdb.exp.keywords.sdev[]
.kdb.exp.keywords.sdev:{
 show "example: sdev - sample standard deviation - {sqrt var[x]*count[x]%-1+count x}";
 show .kdb.desc.keywords.sdev;
 show "sdev 10 343 232 55";
 show sdev 10 343 232 55;
 show "Since 4.1t 2022.04.15, can also traverse columns of tables and general/anymap/nested lists.";
 };

// .kdb.exp.keywords.differ[]
.kdb.exp.keywords.differ:{
 show "example: differ - find where list items change value";
 show .kdb.desc.keywords.differ;
 show "domain: b g x h i j e f c s p m d z n u v t";
 show "range:  b b b b b b b b b b b b b b b b b b";
 show "r[i]=1b                 for i=0";
 show "r[i]=not A[i]~A[i-1]    otherwise";
 show "differ`IBM`IBM`MSFT`CSCO`CSCO";
 show differ`IBM`IBM`MSFT`CSCO`CSCO
 show "differ 1 3 3 4 5 6 6";
 show differ 1 3 3 4 5 6 6;
 show "Split a table with multiple dates into a list of tables with distinct dates.";
 d:2009.10.01+asc 100?30;
 s:100?`IBM`MSFT`CSCO;
 show "t:([]date:d;sym:s;price:100?100f;size:100?1000)";
 show t:([]date:d;sym:s;price:100?100f;size:100?1000);
 show "i:where differ t[`date]";
 show i:where differ t[`date];
 show "tlist:i _ t";
 tlist:i _ t;
 show tlist 0;
 show tlist 1;
 };

// .kdb.exp.keywords.distinct[]
.kdb.exp.keywords.distinct:{
 show "example: distinct - unique items of a list";
 show .kdb.desc.keywords.distinct;
 show "distinct 2 3 7 3 5 3";
 show distinct 2 3 7 3 5 3;
 show "distinct flip `a`b`c!(1 2 1;2 3 2;\"aba\")";
 show distinct flip `a`b`c!(1 2 1;2 3 2;"aba");
 };

// .kdb.exp.keywords.div[]
.kdb.exp.keywords.div:{
 show "example: div - integer division";
 show .kdb.desc.keywords.div;
 show "7 div 3";
 show 7 div 3;
 show "7 div 2 3 4";
 show 7 div 2 3 4;
 show "div is atomic function and has implicit iteration";
 show "(10;20 30)div(3 4; -5)";
 show (10;20 30)div(3 4; -5);
 "div - can apply to dictionaries and keyed tables.";
 show "k:`k xkey update k:`abc`def`ghi from t:flip d:`a`b!(10 -21 3;4 5 -6)";
 show k:`k xkey update k:`abc`def`ghi from t:flip d:`a`b!(10 -21 3;4 5 -6);
 show "d div 5";
 show d div 5;
 show "k div 5";
 show k div 5;
 };

// .kdb.exp.keywords.dsave[]
.kdb.exp.keywords.dsave:{
 show "example: dsave - Write global tables to disk as splayed, enumerated, indexed kdb+ tables.";
 show .kdb.desc.keywords.dsave;
 show "syntax: x dsave y     dsave[x;y]";
 show "After performing dsave, The first column of each table saved has the parted attribute applied to it. If the save path is a list, the first item is the HDB root (where the sym file, if any, will be stored), while the remaining items are a path within the HDB (e.g. a partition)."
 show "t_test:flip`sym`price`size!100?'(-10?`3;1.0;10)";
 show "q_test:flip`sym`bid`ask`bsize`asize!900?'(distinct t`sym;1.0;1.0;10;10)";
 show "`:/tmp/db1 dsave`sym xasc'`t`q";
 show "`:/tmp/db2`2015.01.01 dsave`sym xasc'`t`q";
 };

// .kdb.exp.keywords.each[]
.kdb.exp.keywords.each:{
 show "example: each - iterate a unary";
 show .kdb.desc.keywords.each;
 show " v1 each x   each[v1;x]       v1 peach x   peach[v1;x]";
 show "(vv)each x   each[vv;x]      (vv)peach x   peach[vv;x]";
 show "count each (\"the\";\"quick\";\" brown\";\"fox\"";
 show count each ("the";"quick";" brown";"fox");
 };

// .kdb.exp.keywords.ej[]
.kdb.exp.keywords.ej:{
 show "example: ej - equi join";
 show .kdb.desc.keywords.ej;
 show "syntax: ej[c;t1;t2]";
 show "t:([]sym:`IBM`FDP`FDP`FDP`IBM`MSFT;price:0.7029677 0.08378167 0.06046216 0.658985 0.2608152 0.5433888)";
 t:([]sym:`IBM`FDP`FDP`FDP`IBM`MSFT;price:0.7029677 0.08378167 0.06046216 0.658985 0.2608152 0.5433888);
 show "s:([]sym:`IBM`MSFT;ex:`N`CME;MC:1000 250)";
 show s:([]sym:`IBM`MSFT;ex:`N`CME;MC:1000 250);
 show "ej[`sym;s;t]";
 show ej[`sym;s;t];
 };

// .kdb.exp.keywords.ema[]
.kdb.exp.keywords.ema:{
 show "example: ema - Exponential moving average";
 show .kdb.desc.keywords.ema;
 show "syntax: x ema y    ema[x;y]";
 show "ema[1%3;1,10#0]";
 show ema[1%3;1,10#0];
 show "10-day EMA:"
 show "p:22.27 22.19 22.08 22.17 22.18 22.13 22.23 22.43 22.24 22.29 22.15 22.39 22.38 22.61 23.36 24.05 23.75 23.83 23.95 23.63 23.82 23.87 23.65 23.19 23.1 23.33 22.68 23.1 22.4 22.17";
 p:22.27 22.19 22.08 22.17 22.18 22.13 22.23 22.43 22.24 22.29 22.15 22.39 22.38 22.61 23.36 24.05 23.75 23.83 23.95 23.63 23.82 23.87 23.65 23.19 23.1 23.33 22.68 23.1 22.4 22.17;
 show "(2%1+10)ema p";
 show (2%1+10)ema p;
 };

// .kdb.exp.keywords.enlist[]
.kdb.exp.keywords.enlist:{
 show "example: enlist";
 show .kdb.desc.keywords.enlist;
 show "enlist x    enlist[x]    enlist[x;y;z;…]";
 show "a:10";
 a:10;
 show "b:enlist a";
 show b:enlist a;
 show "c:enlist b";
 show c:enlist b;
 show type each (a;b;c);
 show "a:enlist[til 5;`ibm`goog;\"hello\"]";
 show a:enlist[til 5;`ibm`goog;"hello"];
 };

// .kdb.exp.keywords.eval[]
.kdb.exp.keywords.eval:{
 show "example: eval";
 show .kdb.desc.keywords.eval;
 show parse "2+3";
 show "eval parse \"2+3\"";
 show eval parse "2+3";
 };

// .kdb.exp.keywords.except[]
.kdb.exp.keywords.except:{
 show "example: except - exclude items from a list";
 show .kdb.desc.keywords.except;
 show "syntax: x except y    except[x;y]";
 show "1 2 3 except 2";
 show 1 2 3 except 2;
 show "1 2 3 4 1 3 except 2 3";
 show 1 2 3 4 1 3 except 2 3;
 };

// .kdb.exp.keywords.exec[]
.kdb.exp.keywords.exec:{
 show "example: exec - Return selected rows and columns from a table";
 show .kdb.desc.keywords.exec;
 show "syntax: exec [distinct] ps [by pb] from texp [where pw]";
 show "show exec from sp";
 show exec from sp;
 show "exec qty from sp";
 show exec qty from sp;
 show "exec (qty;s) from sp  / list per column";
 show exec (qty;s) from sp;
 show "exec sum qty by s from sp / dict by key";
 show exec sum qty by s from sp;
 show "exec qty, s by 0b from sp  / table";
 show exec qty, s by 0b from sp;
 show "exec distinct returns only unique items in the first item of the result.";
 show "exec distinct s,p,s from sp";
 show exec distinct s,p,s from sp;
 };

// .kdb.exp.keywords.exp[]
.kdb.exp.keywords.exp:{
 show "example: exp";
 show .kdb.desc.keywords.exp;
 show "exp 1";
 show exp 1;
 show "exp -4.2 0 0.1 0n 0w";
 show exp -4.2 0 0.1 0n 0w;
 show "k:`k xkey update k:`abc`def`ghi from t:flip d:`a`b!(10 -21 3;4 5 -6)";
 show k:`k xkey update k:`abc`def`ghi from t:flip d:`a`b!(10 -21 3;4 5 -6);
 show exp d;
 show exp t;
 show exp k;
 };

// .kdb.exp.keywords.xexp[]
.kdb.exp.keywords.xexp:{
 show "example: xexp";
 show .kdb.desc.keywords.xexp;
 show "2 xexp 8";
 show 2 xexp 8;
 show "1.5 xexp -4.2 0 0.1 0n 0w";
 show 1.5 xexp -4.2 0 0.1 0n 0w;
 };

// .kdb.exp.keywords.fby[]
.kdb.exp.keywords.fby:{
 show "example: fby";
 show .kdb.desc.keywords.fby;
 show "syntax: (aggr;d) fby g";
 show "select from sp where qty > (avg;qty) fby p";
 show select from sp where qty > (avg;qty) fby p;
 show "select from sp where qty = (max;qty) fby p";
 show select from sp where qty = (max;qty) fby p;
 show "update x:12?3 from `sp";
 update x:12?3 from `sp;
 show "show select from sp where qty = (max;qty) fby ([]s;x)";
 show select from sp where qty = (max;qty) fby ([]s;x);
 };

// .kdb.exp.keywords.fill[]
.kdb.exp.keywords.fill:{
 show "example: fill - replace fills";
 show .kdb.desc.keywords.fill;
 show "0^1 2 3 0N";
 show 0^1 2 3 0N;
 show "`nobody^`tom`dick``harry";
 show `nobody^`tom`dick``harry;
 };

// .kdb.exp.keywords.fills[]
.kdb.exp.keywords.fills:{
 show "example: fills - replace nulls with preceding non-nulls";
 show .kdb.desc.keywords.fills;
 show "syntax: fills x";
 show "fills 0N 2 3 0N 0N 7 0N";
 show fills 0N 2 3 0N 0N 7 0N;
 show "update fills c2 from ([] `a`b`c`d`e`f; c2:1 0N 3 0N 0N 5)";
 show update fills c2 from ([] `a`b`c`d`e`f; c2:1 0N 3 0N 0N 5);
 };

// .kdb.exp.keywords.first[]
.kdb.exp.keywords.first:{
 show "example: first - First item of a list";
 show .kdb.desc.keywords.first;
 show "first 1 2 3 4 5";
 show first 1 2 3 4 5;
 show "RaggedArray:(1 2 3;4 5;6 7 8 9;0)";
 show RaggedArray:(1 2 3;4 5;6 7 8 9;0);
 show "first each RaggedArray";
 show first each RaggedArray;
 show RaggedDict:`a`b`c!(1 2;3 4 5;"hello");
 show "first each RaggedDict";
 show first each RaggedDict;
 };

// .kdb.exp.keywords.fkeys[]
.kdb.exp.keywords.fkeys:{
 show "example: fkeys - foreign key columns of a table";
 show .kdb.desc.keywords.fkeys;
 show "f:([x:1 2 3]y:10 20 30)";
 show f:([x:1 2 3]y:10 20 30);
 show "t:([]a:`f$2 2 2;b:0;c:`f$1 1 1)";
 show t:([]a:`f$2 2 2;b:0;c:`f$1 1 1);
 show "meta t";
 show meta t;
 show "fkeys t";
 show fkeys t;
 };

// .kdb.exp.keywords.flip[]
.kdb.exp.keywords.flip:{
 show "example: flip Returns x transposed, where x may be a list of lists, a dictionary or a table. ";
 show .kdb.desc.keywords.flip;
 show "flip (1 2 3;4 5 6)";
 show flip (1 2 3;4 5 6);
 show "D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100)";
 show D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100);
 show "flip D";
 show flip D;
 };

// .kdb.exp.keywords.floor[]
.kdb.exp.keywords.floor:{
 show "example: floor - Round down";
 show .kdb.desc.keywords.floor;
 show "floor -2.1 0 2.1";
 show floor -2.1 0 2.1;
 show "domain b g x h i j e f c s p m d z n u v t";
 show "range  . . . h i j j j c s . . . . . . . ."
 };

// .kdb.exp.keywords.get[]
.kdb.exp.keywords.get:{
 show "example: get - read or memory-map a variable or kdb+ data file";
 show .kdb.desc.keywords.get;
 show "t:get`:NewTrade";
 show "a:42";
 show "get `a";
 };

// .kdb.exp.keywords.getenv[]
.kdb.exp.keywords.getenv:{
 show "example: getenv - Get the value of an environment variable";
 show .kdb.desc.keywords.getenv;
 show "getenv `SHELL";
 };

// .kdb.exp.keywords.group[]
.kdb.exp.keywords.group:{
 show "example: group";
 show .kdb.desc.keywords.group;
 show "group \"mississippi\"";
 show group "mississippi";
 show "To count the number of occurrences of each distinct item:";
 show "count each group \"mississippi\"";
 show count each group "mississippi";
 show "To get the index of the first occurrence of each distinct item";
 show "first each group \"mississippi\"";
 show first each group "mississippi";
 };

// .kdb.exp.keywords.gtime[]
.kdb.exp.keywords.gtime:{
 show "example:  gtime - utc equivalent of local timestamp";
 show .kdb.desc.keywords.gtime;
 show ".z.p";
 show .z.p;
 show "gtime .z.P";
 show gtime .z.p;
 };

// .kdb.exp.keywords.hclose[]
.kdb.exp.keywords.hclose:{
 show "example: hclose";
 show .kdb.desc.keywords.hclose;
 show "h:hopen `::5001";
 show "hclose h";
 };

// .kdb.exp.keywords.hcount[]
.kdb.exp.keywords.hcount:{
 show "example: hcount";
 show .kdb.desc.keywords.hcount;
 show "hcount`:c:/q/test.txt";
 };

// .kdb.exp.keywords.hdel[]
.kdb.exp.keywords.hdel:{
 show "example: hdel";
 show .kdb.desc.keywords.hdel;
 show "hdel`:test.txt";
 show "`:test.txt";
 };

// .kdb.exp.keywords.hopen[]
.kdb.exp.keywords.hopen:{
 show "example: hopen";
 show .kdb.desc.keywords.hopen;
 show "filehandle";
 show "hopen \":path/to/file.txt\"";
 show "localhost, Unix domain socket";
 show "hopen `:unix://5010";
 show "SSL/TLS with hostname";
 show "hopen `:tcps://mydb.us.com:5010";
 show "IP address and timeout";
 show "hopen(\":10.43.23.198:5010\";10000)";
 };

// .kdb.exp.keywords.hsym[]
.kdb.exp.keywords.hsym:{
 show "example: hsym";
 show .kdb.desc.keywords.hsym;
 show "hsym`c:/q/test.txt";
 show hsym`c:/q/test.txt 
 show "hsym`10.43.23.197";
 show hsym`10.43.23.197;
 };

// .kdb.exp.keywords.ij[]
.kdb.exp.keywords.ij:{
 show "example: ij - inner join";
 show .kdb.desc.keywords.ij;
 show .kdb.desc.joins.ij;
 show info;
 show trade;
 show "trade ij info";
 show trade ij info;
 };

// .kdb.exp.keywords.ijf[]
.kdb.exp.keywords.ijf:{
 show "example: ijf - inner join";
 show .kdb.desc.keywords.ij;
 show .kdb.desc.joins.ij;
 show info;
 show trade;
 show "trade ij info";
 show trade ij info;
 };

// .kdb.exp.keywords.in[]
.kdb.exp.keywords.in:{
 show "example: in - whether x is an item of y";
 show .kdb.desc.keywords.in;
 show "\"x\" in \"a\" / atom in atom";
 show "x" in "a";
 show "\"x\" in \"acdexyz\" / atom in vector";
 show "x" in "acdexyz";
 show "\"wx\" in \"acdexyz\" / vector in vector";
 show "wx" in "acdexyz";                          
 show "(\"abc\";(\"def\";\"ghi\");\"jkl\")in \"bed\" / list in vector";
 show ("abc";("def";"ghi");"jkl")in "bed";   
 };

// .kdb.exp.keywords.insert[]
.kdb.exp.keywords.insert:{
 show "example: insert - Insert or append records to a table";
 show .kdb.desc.keywords.insert;
 show x:([a:`x`y];b:10 20);
 show "`x insert (`z;30)";
 show `x insert (`z;30);
 show x;
 show "several records may be appended at once";
 show "`x insert (`s`t;40 50)";
 show `x insert (`s`t;40 50);
 show x;
 };

// .kdb.exp.keywords.inter[]
.kdb.exp.keywords.inter:{
 show "example: inter - intersection of two lists or dictionaries";
 show .kdb.desc.keywords.inter;
 show "1 3 4 2 inter 2 3 5 7 11";
 show 1 3 4 2 inter 2 3 5 7 11;
 show x:(`a`b)!(1 2 3;`x`y`z);
 show y:(`a`b`c)!(1 2 3;2 3 5;`x`y`z);
 show "x inter y";
 show x inter y;
 show x:([]a:`x`y`z`t;b:10 20 30 40);
 show y:([]a:`y`t`x;b:50 40 10);
 show "x inter y";
 show x inter y;
 };

// .kdb.exp.keywords.inv[]
.kdb.exp.keywords.inv:{
 show "example: inv - matrix inverse";
 show .kdb.desc.keywords.inv;
 show a:3 3#2 4 8 3 5 6 0 7 1f;
 show "inv a";
 show inv a;
 };

// .kdb.exp.keywords.key[]
.kdb.exp.keywords.key:{
 show "example: key";
 show .kdb.desc.keywords.key;
 show D:`q`w`e!(1 2;3 4;5 6);
 show key D;
 show key `.;
 show K:([s:`q`w`e]g:1 2 3;h:4 5 6);
 show key K;
 show key`:c:/q;
 f:([f:1 2 3]v:`a`b`c);
 x:`f$3 2;
 key x;
 key each ("abc";101b;1 2 3h;1 2 3;1 2 3;1 2 3f);
 ids:`a`b`c;
 x:`ids$`a`c;
 key x;
 };

// .kdb.exp.keywords.keys[]
.kdb.exp.keywords.keys:{
 show "example: keys - get or set key columns of a table";
 show .kdb.desc.keywords.keys
 keys trade;
 keys `sym xkey trade;
 };

// .kdb.exp.keywords.xkey[]
.kdb.exp.keywords.xkey:{
 show "example: keys - get or set key columns of a table";
 show .kdb.desc.keywords.xkey;
 show `sym xkey trade;
 };

// .kdb.exp.keywords.like[]
.kdb.exp.keywords.like:{
 show "example: like - whether text matches a pattern";
 show .kdb.desc.keywords.like;
 show "`quick like \"qu?ck\"";
 show `quick like "qu?ck";
 show "`brown like \"br[ao]wn\"";
 show `brown like "br[ao]wn";
 show "`quickly like \"quick*\"";
 show `quickly like "quick*";
 show "(`a`b`c!`quick`brown`fox)like \"brown\"";
 show (`a`b`c!`quick`brown`fox)like "brown";
 };

// .kdb.exp.keywords.lj[]
.kdb.exp.keywords.lj:{
 show "example: lj";
 show .kdb.desc.keywords.lj;
 show "syntax is: lj[<unkeyed>;<keyed>] or <unkeyed> lj <keyed>";
 show sector;
 show trades;
 show "trade lj sector";
 show trade lj sector;
 };

// .kdb.exp.keywords.ljf[]
.kdb.exp.keywords.ljf:{
 show "example: ljf";
 show .kdb.desc.keywords.ljf;
 show "syntax is: lj[<unkeyed>;<keyed>] or <unkeyed> lj <keyed>";
 show sector;
 show trades;
 show "trade lj sector";
 show trade lj sector;
 };

// .kdb.exp.keywords.load[]
.kdb.exp.keywords.load:{
 show "example: load - load binary data from a file or directory";
 show .kdb.desc.keywords.load;
 };

// .kdb.exp.keywords.rload[]
.kdb.exp.keywords.rload:{
 show "example: rload - load a splayed table from a directory";
 show .kdb.desc.keywords.rload;
 };

// .kdb.exp.keywords.log[]
.kdb.exp.keywords.log:{
 show "example: log - natural logarithm";
 show .kdb.desc.keywords.log;
 show "log is a multithreaded primitive."
 show log 0.5;
 show log -2 0n 0 0.1 1 42;
 };

// .kdb.exp.keywords.xlog[]
.kdb.exp.keywords.xlog:{
 show "example: xlog";
 show .kdb.desc.keywords.xlog;
 show 1.5 xlog 0 0.125 1 3 0n;
 };

// .kdb.exp.keywords.lower[]
.kdb.exp.keywords.lower:{
 show "example: lower - shift case";
 show .kdb.desc.keywords.lower;
 show "lower `IBM";
 show lower `IBM;
 };

// .kdb.exp.keywords.lsq[]
.kdb.exp.keywords.lsq:{
 show "example: lsq";
 show .kdb.desc.keywords.lsq;
 a:1f+3 4#til 12;
 b:4 4#2 7 -2 5 5 3 6 1 -2 5 2 7 5 0 3 4f;
 show a;
 show b;
 show "a lsq b";
 show a lsq b;
 };

// .kdb.exp.keywords.lower[]
.kdb.exp.keywords.lower:{
 show "example: lower";
 show .kdb.desc.keywords.lower;
 show "lower\"IBM\"";
 show lower"IBM";
 };

// .kdb.exp.keywords.max[]
.kdb.exp.keywords.max:{
 show "example: max";
 show .kdb.desc.keywords.max;
 show "max 2 5 7 1 3";
 show max 2 5 7 1 3;
 show "max \"genie\"";
 show max "genie";
 };

// .kdb.exp.keywords.maxs[]
.kdb.exp.keywords.maxs:{
 show "example: maxs";
 show .kdb.desc.keywords.maxs;
 show "maxs 2 5 7 1 3";
 show maxs 2 5 7 1 3;
 };

// .kdb.exp.keywords.mmax[]
.kdb.exp.keywords.mmax:{
 show "example: mmax";
 show .kdb.desc.keywords.mmax;
 show "3 mmax 2 7 1 3 5 2 8";
 show 3 mmax 2 7 1 3 5 2 8; 
 };

// .kdb.exp.keywords.md5[]
.kdb.exp.keywords.md5:{
 show "example: md5 - message digest hash";
 show .kdb.desc.keywords.md5;
 show "md5 \"this is a not so secret message\"";
 show md5 "this is a not so secret message";
 };

// .kdb.exp.keywords.med[]
.kdb.exp.keywords.med:{
 show "example: med - median";
 show .kdb.desc.keywords.med;
 show "med 10 34 23 123 5 56";
 show med 10 34 23 123 5 56;
 };

// .kdb.exp.keywords.meta[]
.kdb.exp.keywords.meta:{
 show "example: meta - metadata for a table";
 show .kdb.desc.keywords.meta;
 show "meta trade";
 show meta trade;
 };

// .kdb.exp.keywords.min[]
.kdb.exp.keywords.min:{
 show "example: min - minimum";
 show .kdb.desc.keywords.min;
  show "min 2 5 7 1 3";
 show min 2 5 7 1 3;
 show "min \"genie\"";
 show min "genie";
 };

// .kdb.exp.keywords.mins[]
.kdb.exp.keywords.mins:{
 show "example: mins - minimums";
 show .kdb.desc.keywords.mins;
 show "mins 2 5 7 1 3";
 show mins 2 5 7 1 3;
 };

// .kdb.exp.keywords.mmin[]
.kdb.exp.keywords.mmin:{
 show "example: mmin - moving minimums";
 show .kdb.desc.keywords.mmin;
  show "3 mmin 2 7 1 3 5 2 8";
 show 3 mmin 2 7 1 3 5 2 8; 
 };

// .kdb.exp.keywords.mmu[]
.kdb.exp.keywords.mmu:{
 show "example: mmu - matrix multiply";
 show .kdb.desc.keywords.mmu;
 show a:2 4#2 4 8 3 5 6 0 7f;
 show b:4 3#"f"$til 12;
 show "a mmu b";;
 show a mmu b;
 };

// .kdb.exp.keywords.mod[]
.kdb.exp.keywords.mod:{
 show "example: mod - modulus";
 show .kdb.desc.keywords.mod;
 show "-3 -2 -1 0 1 2 3 4 mod 3";
 show -3 -2 -1 0 1 2 3 4 mod 3;
 show "7 mod 2 3 4";
 show 7 mod 2 3 4;
 };

// .kdb.exp.keywords.neg[]
.kdb.exp.keywords.neg:{
 show "example: neg - negate";
 show .kdb.desc.keywords.neg;
 show "neg -1 0 1 2";
 show neg -1 0 1 2;
 show "neg 01001b";
 show neg 01001b;
 show "domain: b g x h i j e f c s p m d z n u v t";
 show "range:  i . i h i j e f i . p m d z n u v t";
 };

// .kdb.exp.keywords.next[]
.kdb.exp.keywords.next:{
 show "example: next - Immediate or near neighbors";
 show .kdb.desc.keywords.next;
 show "next 2 3 5 7 11";
 show next 2 3 5 7 11;
 show "next (1 2;\"abc\";`ibm)";
 show next (1 2;"abc";`ibm);
 show update (next time)-time by sym from quote;
 };

// .kdb.exp.keywords.prev[]
.kdb.exp.keywords.prev:{
 show "example: prev - Immediately preceding item/s in a list";
 show .kdb.desc.keywords.prev;
 show "prev 2 3 5 7 11";
 show prev 2 3 5 7 11;
 show "prev (1 2;\"abc\";`ibm)";
 show "update time:prev time by sym from quote";
 show update time:prev time by sym from quote;
 };

// .kdb.exp.keywords.xprev[]
.kdb.exp.keywords.xprev:{
 show "example: xprev - Nearby items in a list";
 show .kdb.desc.keywords.xprev;
 show "2 xprev 2 7 5 3 11";
 show 2 xprev 2 7 5 3 11;
 show "-2 xprev 2 7 5 3 11";
 show -2 xprev 2 7 5 3 11;
 show "1 xprev \"abcde\"";
 show 1 xprev "abcde";
 };

// .kdb.exp.keywords.not[]
.kdb.exp.keywords.not:{
 show "example: not - Not zero";
 show .kdb.desc.keywords.not;
 show "not -1 0 1 2";
 show not -1 0 1 2;
 show "not `a`b!(-1 0 2;\"abc\",\"c\"$0)";
 show not `a`b!(-1 0 2;"abc","c"$0);
 };

// .kdb.exp.keywords.null[]
.kdb.exp.keywords.null:{
 show "example: null - is null";
 show .kdb.desc.keywords.null;
 show "null 0 0n 0w 1 0n";
 show null 0 0n 0w 1 0n;
 show "where all null ([] c1:`a`b`c; c2:0n 0n 0n; c3:10 0N 30)";
 show where all null ([] c1:`a`b`c; c2:0n 0n 0n; c3:10 0N 30);
 show "null` ";
 show null` ;
 };

// .kdb.exp.keywords.or[]
.kdb.exp.keywords.or:{
 show "example: or - greater of two values, logical OR";
 show .kdb.desc.keywords.or;
 show "5 or 10";
 show 5 or 10;
 };

// .kdb.exp.keywords.over[]
.kdb.exp.keywords.over:{
 show "example: over";
 show .kdb.desc.keywords.over;
 show n:("the ";("quick ";"brown ";("fox ";"jumps ";"over ");"the ");("lazy ";"dog."));
 show "raze over n";
 show raze over n;
 show "(*) over 1 2 3 4 5";
 show (*) over 1 2 3 4 5;
 show "all      over[and;]   &/  Lesser Over";
 show "any      over[or;]    |/  Greater Over";
 show "max      over[|;]     |/  Greater Over";
 show "min      over[&;]     &/  Lesser Over";
 show "prd      over[*;]     */  qMultiply Over";
 show "raze     over[,;]     ,/  Join Over";
 show "sum      over[+;]     +/  Add Over";
 };

// .kdb.exp.keywords.scan[]
.kdb.exp.keywords.scan:{
 show "example: scan";
 show .kdb.desc.keywords.scan;
 show "{x*x} scan .01";
 show {x*x} scan .01;
 show "(+) scan 1 2 3 4 5";
 show (+) scan 1 2 3 4 5;
 /show "maxs     scan[|;]     |\  Greater Scan";
 /show "mins     scan[&;]     &\  Lesser Scan";
 /show "prds     scan[*;]     *\  Multiply Scan";
 /show "sums     scan[+;]     +\  Add Scan";
 };

// .kdb.exp.keywords.parse[]
.kdb.exp.keywords.parse:{
 show "example: parse - parse a string";
 show .kdb.desc.keywords.parse;
 show "parse \"1 2 3 + 5\"";
 show parse "1 2 3 + 5" ;
 show "parse \"1 2 3 +/: 5 7\"";
 show parse "1 2 3 +/: 5 7";
 show "eval parse \"1 2 3 +/: 5 7\"";
 show eval parse "1 2 3 +/: 5 7";
 show "parse \"select part:p,qty by sup:s from sp where qty>200,p=`p1\"";
 show parse "select part:p,qty by sup:s from sp where qty>200,p=`p1";
 };

// .kdb.exp.keywords.pj[]
.kdb.exp.keywords.pj:{
 show "Example: plus join";
 show .kdb.desc.joins.pj;
 show "syntax is: pj[<unkeyed or keyed>;<keyed>]";
 show stocks:([]sym:`IBM`AAPL`GOOG;amount:400 700 1200);
 show newpurchases:([sym:`IBM`GOOG]amount:60 30);
 show "pj[stocks;newpurchases]";
 show pj[stocks;newpurchases]
 };

// .kdb.exp.keywords.prd[]
.kdb.exp.keywords.prd:{
 show "example: prd - product";
 show .kdb.desc.keywords.prd;
 show "prd 2 3 5 7";
 show prd 2 3 5 7;
 };

// .kdb.exp.keywords.prds[]
.kdb.exp.keywords.prds:{
 show "example: prds - products";
 show .kdb.desc.keywords.prds;
 show "prds 2 3 5 7";
 show prds 2 3 5 7;
 };

// .kdb.exp.keywords.prior[]
.kdb.exp.keywords.prior:{
 show "example: prior";
 show .kdb.desc.keywords.prior;
 show "(+) prior til 10";
 show (+) prior til 10;
 };

// .kdb.exp.keywords.rand[]
.kdb.exp.keywords.rand:{
 show "example: rand - pick randomly";
 show .kdb.desc.keywords.rand;
 show "rand 1 30 45 32";
 show rand 1 30 45 32;
 show "rand each 20#6";
 show rand each 20#6;
 };

// .kdb.exp.keywords.rank[]
.kdb.exp.keywords.rank:{
 show "example: rank - position in the sorted list";
 show .kdb.desc.keywords.rank;
 show "rank 2 7 3 2 5";
 show rank 2 7 3 2 5;
 show "iasc 2 7 3 2 5";
 show iasc 2 7 3 2 5;
 };

// .kdb.exp.keywords.ratios[]
.kdb.exp.keywords.ratios:{
 show "example: ratios - ratios between items";
 show .kdb.desc.keywords.ratios;
 show "update ret:ratios price by sym from trade";
 show update ret:ratios price by sym from trade;
 };

// .kdb.exp.keywords.raze[]
.kdb.exp.keywords.raze:{
    show ".kdb.exp.keywords.raze";
    show raze (1 2; 3 4 5);
    b:(1 2;(3 4;5 6);7;8);
    show ".kdb.exp.keywords.raze with multiple levels";
    show b;
    show raze/[b];
 };

// .kdb.exp.keywords.read0[]
.kdb.exp.keywords.read0:{
 show "example: read0 - read tex from a file or process handle";
 show .kdb.desc.keywords.read0;
 show "read0`:test.txt";
 show "read0 (`:foo;6;5)";
 };

// .kdb.exp.keywords.read1[]
.kdb.exp.keywords.read1:{
 show "example: read1 - Read bytes from a file or named pipe";
 show .kdb.desc.keywords.read1;
 show "read1`:test.txt";
 };

// .kdb.exp.keywords.reciprocal[]
.kdb.exp.keywords.reciprocal:{
 show "example: reciprocal - reciprocal of a number";
 show .kdb.desc.keywords.reciprocal;
 show "reciprocal (12;13 14)";
 show reciprocal (12;13 14);
 show "domain b g x h i j e f c s p m d z n u v t";
 show "range  f . f f f f f f f . p f f z f f f f";
 };

// .kdb.exp.keywords.reverse[]
.kdb.exp.keywords.reverse:{
 show "example: reverse - Reverse the order of items of a list or dictionary";
 show .kdb.desc.keywords.reverse;
 show "reverse 1 2 3 4";
 show reverse 1 2 3 4;
 show d:`a`b!(1 2 3;"xyz");
 show "reverse d";
 show reverse d;
 };

// .kdb.exp.keywords.rotate[]
.kdb.exp.keywords.rotate:{
 show "example: rotate - Shift the items of a list to the left or right";
 show .kdb.desc.keywords.rotate;
 show "2 rotate 2 3 5 7 11";
 show 2 rotate 2 3 5 7 11;
 show "-2 rotate 2 3 5 7 11";
 show -2 rotate 2 3 5 7 11;
 };

.kdb.exp.keywords.rsave:{
 show "example: rsave - Save an object to a file";
 show .kdb.desc.keywords.rsave;
 t:([] a:1 2 3; b:`x`y`z);
 show "rsave[`:/tmp/rsave.q] t";
 show rsave[`:/tmp/rsave.q] t;
 };

.kdb.exp.keywords.select:{
 show "example: select - Query a table";
 show .kdb.desc.keywords.select;
 t:([] sym:`a`b`a; px:10 20 30);
 show "select from t where sym=`a";
 show select from t where sym=`a;
 };

.kdb.exp.keywords.show:{
 show "example: show - Display an expression";
 show .kdb.desc.keywords.show;
 show "show 1+2";
 show 1+2;
 };

.kdb.exp.keywords.signum:{
 show "example: signum - Sign of a number";
 show .kdb.desc.keywords.signum;
 show "signum -5 0 7";
 show signum -5 0 7;
 };

.kdb.exp.keywords.sin:{
 show "example: sin - Sine function";
 show .kdb.desc.keywords.sin;
 show "sin 0 0.5";
 show sin 0 0.5;
 };

.kdb.exp.keywords.asin:{
 show "example: asin - Inverse sine";
 show .kdb.desc.keywords.asin;
 show "asin 0 0.5";
 show asin 0 0.5;
 };

.kdb.exp.keywords.sqrt:{
 show "example: sqrt - Square root";
 show .kdb.desc.keywords.sqrt;
 show "sqrt 1 4 9";
 show sqrt 1 4 9;
 };

.kdb.exp.keywords.ss:{
 show "example: ss - String search";
 show .kdb.desc.keywords.ss;
 show "\"hello world\" ss \"o\"";
 show "hello world" ss "o";
 };

.kdb.exp.keywords.ssr:{
 show "example: ssr - String search and replace";
 show .kdb.desc.keywords.ssr;
 show "\"hello world\" ssr (\"o\";\"0\")";
 show "hello world" ssr ("o";"0");
 };

.kdb.exp.keywords.string:{
 show "example: string - Convert to string";
 show .kdb.desc.keywords.string;
 show "string 123";
 show string 123;
 };

.kdb.exp.keywords.sublist:{
 show "example: sublist - Extract items by index list";
 show .kdb.desc.keywords.sublist;
 show "1 3 sublist `a`b`c`d`e";
 show 1 3 sublist `a`b`c`d`e;
 };

.kdb.exp.keywords.sum:{
 show "example: sum - Total of a list";
 show .kdb.desc.keywords.sum;
 show "sum 1 2 3 4";
 show sum 1 2 3 4;
 };

.kdb.exp.keywords.sums:{
 show "example: sums - Cumulative sums";
 show .kdb.desc.keywords.sums;
 show "sums 1 2 3 4";
 show sums 1 2 3 4;
 };

.kdb.exp.keywords.msum:{
 show "example: msum - Moving sum";
 show .kdb.desc.keywords.msum;
 show "2 msum 1 2 3 4 5";
 show 2 msum 1 2 3 4 5;
 };

.kdb.exp.keywords.wsum:{
 show "example: wsum - Weighted sum";
 show .kdb.desc.keywords.wsum;
 show "1 2 wsum 10 20";
 show 1 2 wsum 10 20;
 };

.kdb.exp.keywords.sv:{
 show "example: sv - Join strings";
 show .kdb.desc.keywords.sv;
 show "\"-\" sv (\"a\";\"b\";\"c\")";
 show "-" sv ("a";"b";"c");
 };

.kdb.exp.keywords.vs:{
 show "example: vs - Split string";
 show .kdb.desc.keywords.vs;
 show "\"-\" vs \"a-b-c\"";
 show "-" vs "a-b-c";
 };

.kdb.exp.keywords.system:{
 show "example: system - Execute system command";
 show .kdb.desc.keywords.system;
 show "system \"l\"";
 show system "l";
 };

.kdb.exp.keywords.tables:{
 show "example: tables - List tables in namespace";
 show .kdb.desc.keywords.tables;
 show "tables[]";
 show tables[];
 };

.kdb.exp.keywords.tan:{
 show "example: tan - Tangent";
 show .kdb.desc.keywords.tan;
 show "tan 0 0.5";
 show tan 0 0.5;
 };

.kdb.exp.keywords.atan:{
 show "example: atan - Inverse tangent";
 show .kdb.desc.keywords.atan;
 show "atan 0 1";
 show atan 0 1;
 };

til
.kdb.exp.keywords.til:{
 show "example: til - Integers from 0 to n-1";
 show .kdb.desc.keywords.til;
 show "til 5";
 show til 5;
 };

.kdb.exp.keywords.trim:{
 show "example: trim - Trim whitespace";
 show .kdb.desc.keywords.trim;
 show "trim \"  abc  \"";
 show trim "  abc  ";
 };

.kdb.exp.keywords.ltrim:{
 show "example: ltrim - Trim left whitespace";
 show .kdb.desc.keywords.ltrim;
 show "ltrim \"  abc\"";
 show ltrim "  abc";
 };

.kdb.exp.keywords.rtrim:{
 show "example: rtrim - Trim right whitespace";
 show .kdb.desc.keywords.rtrim;
 show "rtrim \"abc  \"";
 show rtrim "abc  ";
 };


.kdb.exp.keywords.type:{
 show "example: type - Data type code";
 show .kdb.desc.keywords.type;
 show "type 1 2 3";
 show type 1 2 3;
 };

.kdb.exp.keywords.uj:{
 show "example: uj - Union join";
 show .kdb.desc.keywords.uj;
 t1:([] id:1 2; v:10 20);
 t2:([] id:2 3; v:30 40);
 show "t1 uj t2";
 show t1 uj t2;
 };

.kdb.exp.keywords.wj:{
 show "example: wj - Window join";
 show .kdb.desc.keywords.wj;
 };

.kdb.exp.keywords.wj1:{
 show "example: wj1 - Window join (first)";
 show .kdb.desc.keywords.wj1;
 };

.kdb.exp.keywords.union:{
 show "example: union - Set union";
 show .kdb.desc.keywords.union;
 show "union[1 2 3;3 4]";
 show union[1 2 3;3 4];
 };

.kdb.exp.keywords.ungroup:{
 show "example: ungroup - Flatten grouped columns";
 show .kdb.desc.keywords.ungroup;
 t:([] a:1 2; b:(10 20;30 40));
 show "ungroup t";
 show ungroup t;
 };

.kdb.exp.keywords.update:{
 show "example: update - Modify table";
 show .kdb.desc.keywords.update;
 t:([] a:1 2 3; b:10 20 30);
 show "update b:b*2 from t";
 show update b:b*2 from t;
 };

.kdb.exp.keywords.upsert:{
 show "example: upsert - Insert or update";
 show .kdb.desc.keywords.upsert;
 t:([] id:1 2; v:10 20);
 show "upsert[t;([] id:2 3; v:30 40)]";
 show upsert[t;([] id:2 3; v:30 40)];
 };

.kdb.exp.keywords.value:{
 show "example: value - Evaluate symbol";
 show .kdb.desc.keywords.value;
 x:42;
 show "value `x";
 show value `x;
 };

.kdb.exp.keywords.var:{
 show "example: var - Variance";
 show .kdb.desc.keywords.var;
 show "var 1 2 3 4";
 show var 1 2 3 4;
 };

.kdb.exp.keywords.svar:{
 show "example: svar - Sample variance";
 show .kdb.desc.keywords.svar;
 show "svar 1 2 3 4";
 show svar 1 2 3 4;
 };

.kdb.exp.keywords.view:{
 show "example: view - Create a view";
 show .kdb.desc.keywords.view;
 };

.kdb.exp.keywords.views:{
 show "example: views - List views";
 show .kdb.desc.keywords.views;
 show "views[]";
 show views[];
 };

.kdb.exp.keywords.where:{
 show "example: where - Indices of true values";
 show .kdb.desc.keywords.where;
 show "where 1 0 1 1";
 show where 1 0 1 1;
 };

.kdb.exp.keywords.within:{
 show "example: within - Membership in range";
 show .kdb.desc.keywords.within;
 show "5 within 1 10";
 show 5 within 1 10;
 };

.kdb.exp.keywords.xbar:{
 show "example: xbar - Bucket values";
 show .kdb.desc.keywords.xbar;
 show "2 xbar 1 2 3 4 5";
 show 2 xbar 1 2 3 4 5;
 };

.kdb.exp.keywords.xgroup:{
 show "example: xgroup - Group by key";
 show .kdb.desc.keywords.xgroup;
 show "xgroup[`a`b`a;1 2 3]";
 show xgroup[`a`b`a;1 2 3];
 };

.kdb.exp.keywords.xrank:{
 show "example: xrank - Rank within groups";
 show .kdb.desc.keywords.xrank;
 show "xrank 30 10 20";
 show xrank 30 10 20;
 };