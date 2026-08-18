// INFO ====================================================
// Purpose: Initialization to load up all of the scripts
//==========================================================
/ Init related functions

// Author: Spencer
//==========================================================
.kdb.init: {[directory]
    listOfFiles: key hsym `$directory;
    listOfFiles: directory,/:string listOfFiles;
    {system"l ",x} each listOfFiles
 };

init:{
    .kdb.init["./description/"];
    .kdb.init["./dictionary/"];
    .kdb.init["./data/"];
    .kdb.init["./example/"];
    system"l ./scripts/help.q";
 };

init[];