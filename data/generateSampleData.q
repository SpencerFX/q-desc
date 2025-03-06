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