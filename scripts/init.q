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