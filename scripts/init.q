// INFO ====================================================
// Purpose: Initialization to load up all of the scripts
//==========================================================
/ Init related functions

// Author: Spencer
//==========================================================
.kdb.init: {[directory]
    listOfFiles: key hsym `$directory;
    / directory,/:string listOfFiles is missing a path separator -- it
    / concatenates "/path/to/description" directly onto "args.q", producing
    / "/path/to/descriptionargs.q" instead of "/path/to/description/args.q".
    / This was breaking every single .kdb.init[...] call in the README's
    / own quick-start (confirmed against a real q session).
    listOfFiles: (directory,"/"),/:string listOfFiles;
    {system"l ",x} each listOfFiles
 };
