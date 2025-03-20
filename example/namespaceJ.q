// INFO ====================================================
// Purpose: Show examples for j functions
//==========================================================
/ Examples of j functions

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.j.j[]
.kdb.exp.j.j:{
    show .kdb.desc.func.j.j;
    show ".j.j ([]a:1 2;b:`Greetings`Earthlings)";
    show .j.j ([]a:1 2;b:`Greetings`Earthlings);
 };

// .kdb.exp.j.k[]
.kdb.exp.j.k:{
    show .kdb.desc.func.j.k;
    show "deserialize into a dictionary";
    show ".j.k 0N!.j.j `a`b!(0 1;(\"hello\";\"world\"))";
    show .j.k 0N!.j.j `a`b!(0 1;("hello";"world"));
    show "deserialize into a a table";
    show ".j.k 0N!.j.j ([]a:1 2;b:`Greetings`Earthlings)";
    show .j.k 0N!.j.j ([]a:1 2;b:`Greetings`Earthlings);
    show "example syntax: .j.k raze read0 `:t1.json"
 };

// .kdb.exp.j.jd[]
.kdb.exp.j.jd:{
    show .kdb.desc.func.j.jd;
    show ".j.jd(-0w 0 1 2 3 0w;()!())";
    show .j.jd(-0w 0 1 2 3 0w;()!());
 };