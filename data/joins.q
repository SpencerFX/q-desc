// INFO ====================================================
// Purpose: Load in script to use sample data
//==========================================================
/ Sample data to be used joins examples

// Author: Spencer
//==========================================================
// Used for comma joins
location1:([]sym:`JPM`UBS`BCS;city:`NewYork`Zurich`London);
location2:([]sym:`UBS`DB`STT;city:`Zurich`Berlin`Boston);
oldcreditrating:([issuer:`A`B`C`D]rating:`A1`Baa3`Aa2`Baa2);
newcreditrating:([issuer:`B`D`E]rating:`Baa2`Baa1`Aaa);
info:([sym:`GOOG`IBM`MSFT]ceo:`Page`Rometty`Nadella);
trade:([]sym:`GOOG`FDP`GOOG`IBM;price:399 120 401 156;size:100 200 100 400);
sector:([sym:`ADBE`XOM`MET`GM]sector:`tech`energy`insurance`auto);
trades:([]sym:`XOM`GM`MET`GOOG`GM`XOM;price:200 150 60 151 150 199);
nyse:([]sym:`IBM`XOM`GE;marketcap:207 438 212);
lon:([]sym:`HSBA`BP`VOD;sector:`bank`energy`tele;marketcap:129 85 83);
quote_uj:([]time:09:29 09:29 09:32 09:33;sym:`FD`KX`FD`KX;ask:30.23 40.20 30.35 40.35;bid:30.20 40.19 30.33 40.32);
trade_uj:([]time:09:30 09:31 09:32 09:33 09:34 09:35;sym:`FD`FD`KX`FD`KX`FD;price:30.43 30.45 40.45 30.55 41.00 31.00;size:100 200 200 300 300 600);