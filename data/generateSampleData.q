// INFO ====================================================
// Purpose: Load in script to use sample data
//==========================================================
/ Sample data to be used by code examples

// Author: Spencer
//==========================================================
// Set row count
rowCount:5000;

// List of stocks
symList: upper(rowCount?`VOD.L`BARC.L`ENI.MI`RBS.L`HBOS.L`LHAG.DE);

// Random function that uses lower and upper bounds
f:{x+(z?0) mod  1+y-x};
// Apply random data to time in .z.P format
timeRange: f[.z.P - 0D01; .z.P; rowCount];

// Sample tables
trade:([] time: asc timeRange; sym: symList; price:rowCount?100f; size:rowCount?500j);
quote:([] time: asc timeRange; sym: symList; bid:rowCount?100f; ask:rowCount?100f);

s:([s:`s1`s2`s3`s4`s5]
 name:`smith`jones`blake`clark`adams;
 status:20 10 30 20 30;
 city:`london`paris`paris`london`athens)

p:([p:`p1`p2`p3`p4`p5`p6]
 name:`nut`bolt`screw`screw`cam`cog;
 color:`red`green`blue`red`blue`red;
 weight:12 17 17 14 12 19;
 city:`london`paris`rome`london`paris`london)

sp:([]
 s:`s$`s1`s1`s1`s1`s4`s1`s2`s2`s3`s4`s4`s4;	/ fkey
 p:`p$`p1`p2`p3`p4`p5`p6`p1`p2`p2`p2`p4`p5;	/ fkey
 qty:300 200 400 200 100 100 300 400 200 200 300 400)

view::select from sp where qty>200