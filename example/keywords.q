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

// .kdb.exp.keyword.ceiling[]
.kdb.exp.keyword.ceiling:{
 show "example: ceiling - round up";
 show .kdb.desc.keywords.ceiling;
 show "ceiling -2.1 0 2.1";
 show ceiling -2.1 0 2.1;
 show "ceiling is an atomic function with implicit iteration";
 show "ceiling`a`b!(1.2;3.4 5.6)";
 show ceiling`a`b!(1.2;3.4 5.6);
 };

// .kdb.exp.keyword.cols[]
.kdb.exp.keyword.cols:{
 show "example: cols - column names of a table";
 show .kdb.desc.keywords.cols;
 show "cols trade";
 show cols trade;
 };

// .kdb.exp.keyword.cor[]
.kdb.exp.keyword.cor:{
 show "example: cor - correlation";
 show .kdb.desc.keywords.core;
 show "29 10 54 cor 1 3 9";
 show 29 10 54 cor 1 3 9;
 show "10 29 54 cor 1 3 9";
 show 10 29 54 cor 1 3 9;
 };

// .kdb.exp.keyword.cos[]
.kdb.exp.keyword.cos:{
 show "example: cos - cosine";
 show .kdb.desc.keywords.cosine;
 show "cos 0.2";
 show cos 0.2;
 show "cos is an atomic function with implicit iteration";
 show "cos (.2;.3 .4)";
 show cos (.2;.3 .4);
 };

// .kdb.exp.keyword.count[]
.kdb.exp.keyword.count:{
 show "example: count - count the items of a list or dictionary";
 show .kdb.desc.keywords.count;
 show count 0   / atom
 count "zero"  / vector
 count (2;3 5;"eight")  / mixed list
 RaggedArray:(1 2 3;4 5;6 7 8 9;0);
 show count RaggedArray;
 show count each RaggedArray;
 };

// .kdb.exp.keyword.cov[]
.kdb.exp.keyword.cov:{
 show "example: cov - covariance";
 show .kdb.desc.keywords.cov;
 // show "2 3 5 7 cov 3 3 5 9";
 // show 2 3 5 7 cov 3 3 5 9;
 show "select price cov size by sym from trade";
 show select price cov size by sym from trade;
 };

// .kdb.exp.keyword.cross[]
.kdb.exp.keyword.cross:{
 show "example: cross - returns the cross pdocut of x and y.";
 show .kdb.desc.keywords.cross;
 show "1 2 3 cross 10 20";
 show 1 2 3 cross 10 20;
 show "(cross/)(2 3;10;\"abc\")";
 show (cross/)(2 3;10;"abc");
 };

// .kdb.exp.keyword.cut[]
.kdb.exp.keyword.cut:{
 show "example: cut - cut a list or table into a matrix of x columns.";
 show .kdb.desc.keywords.cut;
 show "4 cut til 10";
 show 4 cut til 10;
 show "Otherwise cut behaves as _ Cut.";
 };

// .kdb.exp.keyword.delete[]
.kdb.exp.keyword.delete:{
 show "example: delete";
 show .kdb.desc.keywords.delete;
 show "d:`a`b`c!til 3";
 show d:`a`b`c!til 3;
 show "delete b from `d";
 delete b from `d;
 show d
 };

// .kdb.exp.keyword.deltas[]
.kdb.exp.keyword.deltas:{
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

// .kdb.exp.keyword.desc[]
.kdb.exp.keyword.desc:{
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

// .kdb.exp.keyword.idesc[]
.kdb.exp.keyword.idesc:{
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

// .kdb.exp.keyword.xdesc[]
.kdb.exp.keyword.xdesc:{
 show "example: xdesc";
 show .kdb.desc.keywords.xdesc;
 show "xdesc can sort data on disk directly, without loading the entire table into memory: see xasc.";
 show s;
 show "`city xdesc s";
 show `city xdesc s; 
 };

// .kdb.exp.keyword.dev[]
.kdb.exp.keyword.dev:{
 show "example: dev - standard deviation - {sqrt var x}";
 show .kdb.desc.keywords.dev;
 show "dev 10 343 232 55";
 show dev 10 343 232 55;
 show "Since 4.1t 2022.04.15, can also traverse columns of tables and general/anymap/nested lists.";
 };

// .kdb.exp.keyword.mdev[]
.kdb.exp.keyword.mdev:{
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

// .kdb.exp.keyword.sdev[]
.kdb.exp.keyword.sdev:{
 show "example: sdev - sample standard deviation - {sqrt var[x]*count[x]%-1+count x}";
 show .kdb.desc.keywords.sdev;
 show "sdev 10 343 232 55";
 show sdev 10 343 232 55;
 show "Since 4.1t 2022.04.15, can also traverse columns of tables and general/anymap/nested lists.";
 };

// .kdb.exp.keyword.differ[]
.kdb.exp.keyword.differ:{
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

// .kdb.exp.keyword.distinct[]
.kdb.exp.keyword.distinct:{
 show "example: distinct - unique items of a list";
 show .kdb.desc.keywords.distinct;
 show "distinct 2 3 7 3 5 3";
 show distinct 2 3 7 3 5 3;
 show "distinct flip `a`b`c!(1 2 1;2 3 2;\"aba\")";
 show distinct flip `a`b`c!(1 2 1;2 3 2;"aba");
 };

// .kdb.exp.keyword.div[]
.kdb.exp.keyword.div:{
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

// .kdb.exp.keyword.dsave[]
.kdb.exp.keyword.dsave:{
 show "example: dsave - Write global tables to disk as splayed, enumerated, indexed kdb+ tables.";
 show .kdb.desc.keywords.dsave;
 show "syntax: x dsave y     dsave[x;y]";
 show "After performing dsave, The first column of each table saved has the parted attribute applied to it. If the save path is a list, the first item is the HDB root (where the sym file, if any, will be stored), while the remaining items are a path within the HDB (e.g. a partition)."
 show "t_test:flip`sym`price`size!100?'(-10?`3;1.0;10)";
 show "q_test:flip`sym`bid`ask`bsize`asize!900?'(distinct t`sym;1.0;1.0;10;10)";
 show "`:/tmp/db1 dsave`sym xasc'`t`q";
 show "`:/tmp/db2`2015.01.01 dsave`sym xasc'`t`q";
 };

// .kdb.exp.keyword.each[]
.kdb.exp.keyword.each:{
 show "example: each - iterate a unary";
 show .kdb.desc.keywords.each;
 show " v1 each x   each[v1;x]       v1 peach x   peach[v1;x]";
 show "(vv)each x   each[vv;x]      (vv)peach x   peach[vv;x]";
 show "count each (\"the\";\"quick\";\" brown\";\"fox\"";
 show count each ("the";"quick";" brown";"fox");
 };

// .kdb.exp.keyword.ej[]
.kdb.exp.keyword.ej:{
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

// .kdb.exp.keyword.ema[]
.kdb.exp.keyword.ema:{
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

// .kdb.exp.keyword.enlist[]
.kdb.exp.keyword.enlist:{
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

// .kdb.exp.keyword.eval[]
.kdb.exp.keyword.eval:{
 show "example: eval";
 show .kdb.desc.keywords.eval;
 show parse "2+3";
 show "eval parse \"2+3\"";
 show eval parse "2+3";
 };

// .kdb.exp.keyword.except[]
.kdb.exp.keyword.except:{
 show "example: except - exclude items from a list";
 show .kdb.desc.keywords.except;
 show "syntax: x except y    except[x;y]";
 show "1 2 3 except 2";
 show 1 2 3 except 2;
 show "1 2 3 4 1 3 except 2 3";
 show 1 2 3 4 1 3 except 2 3;
 };

// .kdb.exp.keyword.exec[]
.kdb.exp.keyword.exec:{
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

// .kdb.exp.keyword.exp[]
.kdb.exp.keyword.exp:{
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

// .kdb.exp.keyword.xexp[]
.kdb.exp.keyword.xexp:{
 show "example: xexp";
 show .kdb.desc.keywords.xexp;
 show "2 xexp 8";
 show 2 xexp 8;
 show "1.5 xexp -4.2 0 0.1 0n 0w";
 show 1.5 xexp -4.2 0 0.1 0n 0w;
 };

// .kdb.exp.keyword.fby[]
.kdb.exp.keyword.fby:{
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

// .kdb.exp.keyword.fill[]
.kdb.exp.keyword.fill:{
 show "example: fill - replace fills";
 show .kdb.desc.keywords.fill;
 show "0^1 2 3 0N";
 show 0^1 2 3 0N;
 show "`nobody^`tom`dick``harry";
 show `nobody^`tom`dick``harry;
 };

// .kdb.exp.keyword.fills[]
.kdb.exp.keyword.fills:{
 show "example: fills - replace nulls with preceding non-nulls";
 show .kdb.desc.keywords.fills;
 show "syntax: fills x";
 show "fills 0N 2 3 0N 0N 7 0N";
 show fills 0N 2 3 0N 0N 7 0N;
 show "update fills c2 from ([] `a`b`c`d`e`f; c2:1 0N 3 0N 0N 5)";
 show update fills c2 from ([] `a`b`c`d`e`f; c2:1 0N 3 0N 0N 5);
 };

// .kdb.exp.keyword.first[]
.kdb.exp.keyword.first:{
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

// .kdb.exp.keyword.fkeys[]
.kdb.exp.keyword.fkeys:{
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

// .kdb.exp.keyword.flip[]
.kdb.exp.keyword.flip:{
 show "example: flip Returns x transposed, where x may be a list of lists, a dictionary or a table. ";
 show .kdb.desc.keywords.flip;
 show "flip (1 2 3;4 5 6)";
 show flip (1 2 3;4 5 6);
 show "D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100)";
 show D:`sym`price`size!(`IBM`MSFT;10.2 23.45;100 100);
 show "flip D";
 show flip D;
 };

// .kdb.exp.keyword.floor[]
.kdb.exp.keyword.floor:{
 show "example: floor - Round down";
 show .kdb.desc.keywords.floor;
 show "floor -2.1 0 2.1";
 show floor -2.1 0 2.1;
 show "domain b g x h i j e f c s p m d z n u v t";
 show "range  . . . h i j j j c s . . . . . . . ."
 };

// .kdb.exp.keyword.get[]
.kdb.exp.keyword.get:{
 show "example: get - read or memory-map a variable or kdb+ data file";
 show .kdb.desc.keywords.get;
 show "t:get`:NewTrade";
 show "a:42";
 show "get `a";
 };

// .kdb.exp.keyword.getenv[]
.kdb.exp.keyword.getenv:{
 show "example: getenv - Get the value of an environment variable";
 show .kdb.desc.keywords.getenv;
 show "getenv `SHELL";
 };

// .kdb.exp.keyword.group[]
.kdb.exp.keyword.group:{
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

// .kdb.exp.keyword.gtime[]
.kdb.exp.keyword.gtime:{
 show "example:  gtime - utc equivalent of local timestamp";
 show .kdb.desc.keywords.gtime;
 show ".z.p";
 show .z.p;
 show "gtime .z.P";
 show gtime .z.p;
 };

// .kdb.exp.keyword.hclose[]
.kdb.exp.keyword.hclose:{
 show "example: hclose";
 show .kdb.desc.keywords.hclose;
 show "h:hopen `::5001";
 show "hclose h";
 };

// .kdb.exp.keyword.hcount[]
.kdb.exp.keyword.hcount:{
 show "example: hcount";
 show .kdb.desc.keywords.hcount;
 show "hcount`:c:/q/test.txt";
 };

// .kdb.exp.keyword.hdel[]
.kdb.exp.keyword.hdel:{
 show "example: hdel";
 show .kdb.desc.keywords.hdel;
 show "hdel`:test.txt";
 show "`:test.txt";
 };

// .kdb.exp.keyword.hopen[]
.kdb.exp.keyword.hopen:{
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

// .kdb.exp.keyword.hsym[]
.kdb.exp.keyword.hsym:{
 show "example: hsym";
 show .kdb.desc.keywords.hsym;
 show "hsym`c:/q/test.txt";
 show hsym`c:/q/test.txt 
 show "hsym`10.43.23.197";
 show hsym`10.43.23.197;
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