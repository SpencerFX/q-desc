// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different overloads

// Author: Spencer
//==========================================================
.kdb.dict.overloads: (!) . flip raze 2 cut
    (
        (`amendAt; .kdb.desc.overloads.amendAt);
        (`applyAt; .kdb.desc.overloads.applyAt);
        (`cast; .kdb.desc.overloads.cast);
        (`cond; .kdb.desc.overloads.cond);
        (`dotAmend; .kdb.desc.overloads.dotAmend);
        (`dotApply; .kdb.desc.overloads.dotApply);
        (`dotIndex; .kdb.desc.overloads.dotIndex);
        (`dotReplace; .kdb.desc.overloads.dotReplace);
        (`dotTrap; .kdb.desc.overloads.dotTrap);
        (`enumExtend; .kdb.desc.overloads.enumExtend);
        (`enumerate; .kdb.desc.overloads.enumerate);
        (`find; .kdb.desc.overloads.find);
        (`indexAt; .kdb.desc.overloads.indexAt);
        (`pad; .kdb.desc.overloads.pad);
        (`permute; .kdb.desc.overloads.permute);
        (`replaceAt; .kdb.desc.overloads.replaceAt);
        (`roll; .kdb.desc.overloads.roll);
        (`select; .kdb.desc.overloads.select);
        (`simpleExec; .kdb.desc.overloads.simpleExec);
        (`tok; .kdb.desc.overloads.tok);
        (`trapAt; .kdb.desc.overloads.trapAt);
        (`vectorConditional; .kdb.desc.overloads.vectorConditional)
    );