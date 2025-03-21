// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the catetegories of functions

// Author: Spencer
//==========================================================
.kdb.dict.category: (!) . flip raze 2 cut
    (
        (`control; .kdb.desc.args.b);
        (`env; .kdb.desc.args.c);
        (`interpret; .kdb.desc.args.C);
        (`io; .kdb.desc.args.e);
        (`iterate; .kdb.desc.args.E);
        (`join; .kdb.desc.args.g);
        (`list; .kdb.desc.args.l);
        (`logic; .kdb.desc.args.L);
        (`math; .kdb.desc.args.m);
        (`meta; .kdb.desc.args.p);
        (`query; .kdb.desc.args.P);
        (`sort; .kdb.desc.args.q);
        (`table; .kdb.desc.args.r);
        (`text; .kdb.desc.args.s)
    );