// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the different iterators

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.iterators: (!) . flip raze 2 cut
    (
        (`each; .kdb.desc.iterators.each);
        (`eachLeft; .kdb.desc.iterators.eachLeft);
        (`eachRight; .kdb.desc.iterators.eachRight);
        (`eachParallel; .kdb.desc.iterators.eachParallel);
        (`peach; .kdb.desc.iterators.peach);
        (`eachPrior; .kdb.desc.iterators.eachPrior);
        (`case; .kdb.desc.iterators.case);
        (`cross; .kdb.desc.iterators.cross)
    );