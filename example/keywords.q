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
 show "example: in";
 show .kdb.desc.keywords.in;

 };

// .kdb.exp.keywords.insert[]
.kdb.exp.keywords.insert:{
 show "example: insert";
 show .kdb.desc.keywords.insert;

 };

// .kdb.exp.keywords.inter[]
.kdb.exp.keywords.inter:{
 show "example: ";
 show .kdb.desc.keywords.inter
 
 };

// .kdb.exp.keywords.inv[]
.kdb.exp.keywords.inv:{
 show "example: ";
 show .kdb.desc.keywords.inv

 };

// .kdb.exp.keywords.key[]
.kdb.exp.keywords.key:{
 show "example: ";
 show .kdb.desc.keywords.key
 
 };

// .kdb.exp.keywords.keys[]
.kdb.exp.keywords.keys:{
 show "example: ";
 show .kdb.desc.keywords.keys
 
 };

// .kdb.exp.keywords.xkey[]
.kdb.exp.keywords.xkey:{
 show "example: ";
 show .kdb.desc.keywords.xkey

 };

// .kdb.exp.keywords.like[]
.kdb.exp.keywords.like:{
 show "example: ";
 show .kdb.desc.keywords.like
 
 };

// .kdb.exp.keywords.lj[]
.kdb.exp.keywords.lj:{
 show "example: ";
 show .kdb.desc.keywords.lj
 
 };

// .kdb.exp.keywords.ljf[]
.kdb.exp.keywords.ljf:{
 show "example: ";
 show .kdb.desc.keywords.ljf

 };

// .kdb.exp.keywords.load[]
.kdb.exp.keywords.load:{
 show "example: ";
 show .kdb.desc.keywords.load
 
 };

// .kdb.exp.keywords.rload[]
.kdb.exp.keywords.rload:{
 show "example: ";
 show .kdb.desc.keywords.rload
 
 };

// .kdb.exp.keywords.log[]
.kdb.exp.keywords.log:{
 show "example: ";
 show .kdb.desc.keywords.log

 };

// .kdb.exp.keywords.xlog[]
.kdb.exp.keywords.xlog:{
 show "example: ";
 show .kdb.desc.keywords.xlog
 
 };

// .kdb.exp.keywords.lower[]
.kdb.exp.keywords.lower:{
 show "example: ";
 show .kdb.desc.keywords.lower
 
 };

// .kdb.exp.keywords.lsq[]
.kdb.exp.keywords.lsq:{
 show "example: ";
 show .kdb.desc.keywords.lsq

 };

// .kdb.exp.keywords.lower[]
.kdb.exp.keywords.lower:{
 show "example: ";
 show .kdb.desc.keywords.lower
 
 };

// .kdb.exp.keywords.max[]
.kdb.exp.keywords.max:{
 show "example: ";
 show .kdb.desc.keywords.max
 
 };

// .kdb.exp.keywords.maxs[]
.kdb.exp.keywords.maxs:{
 show "example: ";
 show .kdb.desc.keywords.maxs

 };

// .kdb.exp.keywords.mmax[]
.kdb.exp.keywords.mmax:{
 show "example: ";
 show .kdb.desc.keywords.mmax
 
 };

// .kdb.exp.keywords.md5[]
.kdb.exp.keywords.md5:{
 show "example: ";
 show .kdb.desc.keywords.md5
 
 };

// .kdb.exp.keywords.med[]
.kdb.exp.keywords.med:{
 show "example: ";
 show .kdb.desc.keywords.med

 };

// .kdb.exp.keywords.meta[]
.kdb.exp.keywords.meta:{
 show "example: ";
 show .kdb.desc.keywords.meta
 
 };

// .kdb.exp.keywords.min[]
.kdb.exp.keywords.min:{
 show "example: ";
 show .kdb.desc.keywords.min
 
 };

// .kdb.exp.keywords.mins[]
.kdb.exp.keywords.mins:{
 show "example: ";
 show .kdb.desc.keywords.mins

 };

// .kdb.exp.keywords.mmin[]
.kdb.exp.keywords.mmin:{
 show "example: ";
 show .kdb.desc.keywords.mmin
 
 };

// .kdb.exp.keywords.mmu[]
.kdb.exp.keywords.mmu:{
 show "example: ";
 show .kdb.desc.keywords.mmu
 
 };

// .kdb.exp.keywords.mod[]
.kdb.exp.keywords.mod:{
 show "example: ";
 show .kdb.desc.keywords.mod

 };

// .kdb.exp.keywords.neg[]
.kdb.exp.keywords.neg:{
 show "example: ";
 show .kdb.desc.keywords.neg
 
 };

// .kdb.exp.keywords.next[]
.kdb.exp.keywords.next:{
 show "example: ";
 show .kdb.desc.keywords.next
 
 };

// .kdb.exp.keywords.prev[]
.kdb.exp.keywords.prev:{
 show "example: ";
 show .kdb.desc.keywords.prev

 };

// .kdb.exp.keywords.xprev[]
.kdb.exp.keywords.xprev:{
 show "example: ";
 show .kdb.desc.keywords.xprev

 };

// .kdb.exp.keywords.not[]
.kdb.exp.keywords.not:{
 show "example: ";
 show .kdb.desc.keywords.not

 };

// .kdb.exp.keywords.null[]
.kdb.exp.keywords.null:{
 show "example: ";
 show .kdb.desc.keywords.null

 };

// .kdb.exp.keywords.or[]
.kdb.exp.keywords.or:{
 show "example: ";
 show .kdb.desc.keywords.or

 };

// .kdb.exp.keywords.over[]
.kdb.exp.keywords.over:{
 show "example: ";
 show .kdb.desc.keywords.over

 };

// .kdb.exp.keywords.scan[]
.kdb.exp.keywords.scan:{
 show "example: ";
 show .kdb.desc.keywords.scan

 };

// .kdb.exp.keywords.parse[]
.kdb.exp.keywords.parse:{
 show "example: ";
 show .kdb.desc.keywords.parse

 };

// .kdb.exp.keywords.pj[]
.kdb.exp.keywords.pj:{
 show "example: ";
 show .kdb.desc.keywords.pj

 };

// .kdb.exp.keywords.prd[]
.kdb.exp.keywords.prd:{
 show "example: ";
 show .kdb.desc.keywords.prd

 };

// .kdb.exp.keywords.prds[]
.kdb.exp.keywords.prds:{
 show "example: ";
 show .kdb.desc.keywords.prds

 };

// .kdb.exp.keywords.prior[]
.kdb.exp.keywords.prior:{
 show "example: ";
 show .kdb.desc.keywords.prior

 };

// .kdb.exp.keywords.rand[]
.kdb.exp.keywords.rand:{
 show "example: ";
 show .kdb.desc.keywords.rand

 };

// .kdb.exp.keywords.rank[]
.kdb.exp.keywords.rank:{
 show "example: ";
 show .kdb.desc.keywords.rank

 };

// .kdb.exp.keywords.ratios[]
.kdb.exp.keywords.ratios:{
 show "example: ";
 show .kdb.desc.keywords.ratios

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
 show "example: ";
 show .kdb.desc.keywords.read0

 };

// .kdb.exp.keywords.read1[]
.kdb.exp.keywords.read1:{
 show "example: ";
 show .kdb.desc.keywords.read1

 };

// .kdb.exp.keywords.reciprocal[]
.kdb.exp.keywords.reciprocal:{
 show "example: ";
 show .kdb.desc.keywords.reciprocal

 };

// .kdb.exp.keywords.reverse[]
.kdb.exp.keywords.reverse:{
 show "example: ";
 show .kdb.desc.keywords.reverse

 };

// .kdb.exp.keywords.rotate[]
.kdb.exp.keywords.rotate:{
 show "example: ";
 show .kdb.desc.keywords.rotate

 };

// .kdb.exp.keywords.rsave[]
.kdb.exp.keywords.rsave:{
 show "example: ";
 show .kdb.desc.keywords.rsave

 };

// .kdb.exp.keywords.select[]
.kdb.exp.keywords.select:{
 show "example: ";
 show .kdb.desc.keywords.select

 };

// .kdb.exp.keywords.show[]
.kdb.exp.keywords.show:{
 show "example: ";
 show .kdb.desc.keywords.show

 };

// .kdb.exp.keywords.signum[]
.kdb.exp.keywords.signum:{
 show "example: ";
 show .kdb.desc.keywords.signum

 };

// .kdb.exp.keywords.sin[]
.kdb.exp.keywords.sin:{
 show "example: ";
 show .kdb.desc.keywords.sin

 };

// .kdb.exp.keywords.asin[]
.kdb.exp.keywords.asin:{
 show "example: ";
 show .kdb.desc.keywords.asin

 };

// .kdb.exp.keywords.sqrt[]
.kdb.exp.keywords.sqrt:{
 show "example: ";
 show .kdb.desc.keywords.sqrt

 };

// .kdb.exp.keywords.ss[]
.kdb.exp.keywords.ss:{
 show "example: ";
 show .kdb.desc.keywords.ss

 };

// .kdb.exp.keywords.ssr[]
.kdb.exp.keywords.ssr:{
 show "example: ";
 show .kdb.desc.keywords.ssr

 };

// .kdb.exp.keywords.string[]
.kdb.exp.keywords.string:{
 show "example: ";
 show .kdb.desc.keywords.string

 };

// .kdb.exp.keywords.sublist[]
.kdb.exp.keywords.sublist:{
 show "example: ";
 show .kdb.desc.keywords.sublist

 };

// .kdb.exp.keywords.sum[]
.kdb.exp.keywords.sum:{
 show "example: ";
 show .kdb.desc.keywords.sum

 };

// .kdb.exp.keywords.sums[]
.kdb.exp.keywords.sums:{
 show "example: ";
 show .kdb.desc.keywords.sums

 };

// .kdb.exp.keywords.msum[]
.kdb.exp.keywords.msum:{
 show "example: ";
 show .kdb.desc.keywords.msum

 };

// .kdb.exp.keywords.wsum[]
.kdb.exp.keywords.wsum:{
 show "example: ";
 show .kdb.desc.keywords.wsum

 };

// .kdb.exp.keywords.sv[]
.kdb.exp.keywords.sv:{
 show "example: ";
 show .kdb.desc.keywords.sv

 };

// .kdb.exp.keywords.system[]
.kdb.exp.keywords.system:{
 show "example: ";
 show .kdb.desc.keywords.system

 };

// .kdb.exp.keywords.tables[]
.kdb.exp.keywords.tables:{
 show "example: ";
 show .kdb.desc.keywords.tables

 };

// .kdb.exp.keywords.tan[]
.kdb.exp.keywords.tan:{
 show "example: ";
 show .kdb.desc.keywords.tan

 };

// .kdb.exp.keywords.atan[]
.kdb.exp.keywords.atan:{
 show "example: ";
 show .kdb.desc.keywords.atan

 };

// .kdb.exp.keywords.til[]
.kdb.exp.keywords.til:{
 show "example: ";
 show .kdb.desc.keywords.til

 };

// .kdb.exp.keywords.trim[]
.kdb.exp.keywords.trim:{
 show "example: ";
 show .kdb.desc.keywords.trim

 };

// .kdb.exp.keywords.ltrim[]
.kdb.exp.keywords.ltrim:{
 show "example: ";
 show .kdb.desc.keywords.ltrim

 };

// .kdb.exp.keywords.rtrim[]
.kdb.exp.keywords.rtrim:{
 show "example: ";
 show .kdb.desc.keywords.rtrim

 };

// .kdb.exp.keywords.type[]
.kdb.exp.keywords.type:{
 show "example: ";
 show .kdb.desc.keywords.type

 };

// .kdb.exp.keywords.uj[]
.kdb.exp.keywords.uj:{
 show "example: ";
 show .kdb.desc.keywords.uj

 };

// .kdb.exp.keywords.union[]
.kdb.exp.keywords.union:{
 show "example: ";
 show .kdb.desc.keywords.union

 };

// .kdb.exp.keywords.ungroup[]
.kdb.exp.keywords.ungroup:{
 show "example: ";
 show .kdb.desc.keywords.ungroup

 };

// .kdb.exp.keywords.update[]
.kdb.exp.keywords.update:{
 show "example: ";
 show .kdb.desc.keywords.update

 };

// .kdb.exp.keywords.upsert[]
.kdb.exp.keywords.upsert:{
 show "example: ";
 show .kdb.desc.keywords.upsert

 };

// .kdb.exp.keywords.value[]
.kdb.exp.keywords.value:{
 show "example: ";
 show .kdb.desc.keywords.value

 };

// .kdb.exp.keywords.var[]
.kdb.exp.keywords.var:{
 show "example: ";
 show .kdb.desc.keywords.var

 };

// .kdb.exp.keywords.svar[]
.kdb.exp.keywords.svar:{
 show "example: ";
 show .kdb.desc.keywords.svar

 };

// .kdb.exp.keywords.view[]
.kdb.exp.keywords.view:{
 show "example: ";
 show .kdb.desc.keywords.view

 };

// .kdb.exp.keywords.views[]
.kdb.exp.keywords.views:{
 show "example: ";
 show .kdb.desc.keywords.views

 };

// .kdb.exp.keywords.vs[]
.kdb.exp.keywords.vs:{
 show "example: ";
 show .kdb.desc.keywords.vs

 };

// .kdb.exp.keywords.where[]
.kdb.exp.keywords.where:{
 show "example: ";
 show .kdb.desc.keywords.where

 };

// .kdb.exp.keywords.within[]
.kdb.exp.keywords.within:{
 show "example: ";
 show .kdb.desc.keywords.within

 };

// .kdb.exp.keywords.wj[]
.kdb.exp.keywords.wj:{
 show "example: ";
 show .kdb.desc.keywords.wj

 };

// .kdb.exp.keywords.wj1[]
.kdb.exp.keywords.wj1:{
 show "example: ";
 show .kdb.desc.keywords.wj1

 };

// .kdb.exp.keywords.xbar[]
.kdb.exp.keywords.xbar:{
 show "example: ";
 show .kdb.desc.keywords.xbar

 };

// .kdb.exp.keywords.xgroup[]
.kdb.exp.keywords.xgroup:{
 show "example: ";
 show .kdb.desc.keywords.xgroup

 };

// .kdb.exp.keywords.xrank[]
.kdb.exp.keywords.xrank:{
 show "example: ";
 show .kdb.desc.keywords.xrank

 };