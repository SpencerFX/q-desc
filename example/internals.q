// INFO ====================================================
// Purpose: Show examples for internal functions
//==========================================================
/ Examples of internal functions

// Author: Spencer
//==========================================================
\c 300 500
// .kdb.exp.func.minus4Bang[]
.kdb.exp.func.minus4Bang:{
 show "Example: -4!x";
 show .kdb.desc.func.minus4Bang;
 show "-4!\"select this from that\"";
 show -4!"select this from that";
 };

// .kdb.exp.func.minus8Bang[]
.kdb.exp.func.minus8Bang:{
 show "Example: -8!x";
 show .kdb.desc.func.minus8Bang;
 show "-8!1 2 3";
 show -8!1 2 3;
 };

// .kdb.exp.func.minus9Bang[]
.kdb.exp.func.minus9Bang:{
 show "Example: -9!x";
 show .kdb.desc.func.minus9Bang;
 show "-9!0x0100000026000000070003000000010000000000000002000000000000000300000000000000";
 show -9!0x0100000026000000070003000000010000000000000002000000000000000300000000000000;
 };

// .kdb.exp.func.minus10Bang[]
.kdb.exp.func.minus10Bang:{
 show "Example: -10!x";
 show .kdb.desc.func.minus10Bang;
 show "-10!20h";
 show -10!20h;
 show "ee:`a`b`c";
 show ee:`a`b`c;
 show "vv:`ee$`a`a`b";
 show vv:`ee$`a`a`b;
 show type vv;
 show "-10!20h";
 show -10!20h;
 };

// .kdb.exp.func.minus11Bang[]
.kdb.exp.func.minus11Bang:{
 show "Example: -11!x";
 show "Example: -11!(-1;x)";
 show "-11!(-2;x)";
 show "-11!(n;x)";
 show .kdb.desc.func.minus11Bang;
 };

// .kdb.exp.func.minus16Bang[]
.kdb.exp.func.minus16Bang:{
 show "Example: -16!x";
 show .kdb.desc.func.minus16Bang;
 a:5;
 show "-16!a";
 show -16!a;
 show "a:b:c:d:e:1 2 3";
 show a:b:c:d:e:1 2 3;
 show "-16!a";
 show -16!a;
 };

// .kdb.exp.func.minus18Bang[]
.kdb.exp.func.minus18Bang:{
 show "Example: -18!x";
 show .kdb.desc.func.minus18Bang;
 show "count -8!til 1000 / uncompressed";
 show count -8!til 1000;
 show "count -18!til 1000 / compressed";
 show count -18!til 1000;
 };

// .kdb.exp.func.minus21Bang[]
.kdb.exp.func.minus21Bang:{
 show "Example: -21!x";
 show .kdb.desc.func.minus21Bang;
 };

// .kdb.exp.func.minus22Bang[]
.kdb.exp.func.minus22Bang:{
 show "Example: -22!x";
 show .kdb.desc.func.minus22Bang;
 show "v:til 100000";
 v:til 100000;
 show "system\"\t do[5000;-22!v]\""
 system "t do[5000;-22!v]"
 show "system \"t do[5000;count -8!v]\"";
 system "t do[5000;count -8!v]";
 show "(-22!v)=count -8!v";
 show (-22!v)=count -8!v;
 };

// .kdb.exp.func.minus23Bang[]
.kdb.exp.func.minus23Bang:{
 show "Example: -23!x";
 show .kdb.desc.func.minus23Bang;
 };

// .kdb.exp.func.minus25Bang[]
.kdb.exp.func.minus25Bang:{
 show "Example: -25!x";
 show .kdb.desc.func.minus25Bang;
 show "-25!(handles; msg)";
 show "h:hopen each 5000 5001";
 show "-25!(h;0Ng)";
 show "'type error serializing for handle 5";
 };

// .kdb.exp.func.minus26Bang[]
.kdb.exp.func.minus26Bang:{
 show "Example: -26!x";
 show .kdb.desc.func.minus26Bang;
 show "-26!)[]";
 show (-26!)[];
 };

// .kdb.exp.func.minus27Bang[]
.kdb.exp.func.minus27Bang:{
 show "Example: -27!(x;y)";
 show .kdb.desc.func.minus27Bang;
 show "-27!(3i;0 1+123456789.4567)";
 show -27!(3i;0 1+123456789.4567);
 };

// .kdb.exp.func.minus23Bang[]
.kdb.exp.func.minus23Bang:{
 show "Example: -23!x";
 show .kdb.desc.func.minus23Bang;
 };

// .kdb.exp.func.minus30Bang[]
.kdb.exp.func.minus30Bang:{
 show "Example: -30!x";
 show .kdb.desc.func.minus30Bang;
 show key .z.W;
 show "-30!(first key .z.W;0b;`hello`world)";
 show "results in error as the handle was not expecting a response msg";
 };

// .kdb.exp.func.minus33Bang[]
.kdb.exp.func.minus33Bang:{
 show "Example: -33!x";
 show .kdb.desc.func.minus33Bang;
 show "raze string -33!\"mypassword\"";
 show raze string -33!"mypassword";
 };

// .kdb.exp.func.minus36Bang[]
.kdb.exp.func.minus36Bang:{
 show "Example: -36!x";
 show .kdb.desc.func.minus36Bang;
 show "syntax: -36!(::)    / since 4.1 2024.03.12 and 4.0 2024.03.02";
 show "syntax: -36!(x;y)";
 show "syntax: -36!(x;y;z) / since 4.1 2024.03.12 and 4.0 2024.03.02";
 };

// .kdb.exp.func.minus38Bang[]
.kdb.exp.func.minus38Bang:{
 show h::hopen `:localhost:5001;
 show "{([]h)!-38!h:.z.H}[]";
 show {([]h)!-38!h:.z.H}[];
 };

// .kdb.exp.func.minus120Ban
.kdb.exp.func.minus120Bang:{
 show "Example: -120!x";
 show .kdb.desc.func.minus120Bang;
 show "-120!'(1 2 3;.m.x:1 2 3)";
 show -120!'(1 2 3;.m.x:1 2 3);
 };