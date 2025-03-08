// INFO ====================================================
// Purpose: Dictionary to utilize descriptions
//==========================================================
/ Dictionary with information of the comand line arguments

// Author: Spencer
//==========================================================
// Dictionary for joins
.kdb.dict.cli: (!) . flip raze 2 cut
    (
        (`b; .kdb.desc.args.b);
        (`c; .kdb.desc.args.c);
        (`C; .kdb.desc.args.C);
        (`e; .kdb.desc.args.e);
        (`E; .kdb.desc.args.E);
        (`g; .kdb.desc.args.g);
        (`l; .kdb.desc.args.l);
        (`L; .kdb.desc.args.L);
        (`m; .kdb.desc.args.m);
        (`p; .kdb.desc.args.p);
        (`P; .kdb.desc.args.P);
        (`q; .kdb.desc.args.q);
        (`r; .kdb.desc.args.r);
        (`s; .kdb.desc.args.s);
        (`S; .kdb.desc.args.S);
        (`T; .kdb.desc.args.T);
        (`u; .kdb.desc.args.u);
        (`U; .kdb.desc.args.U);
        (`w; .kdb.desc.args.w);
        (`W; .kdb.desc.args.W);
        (`z; .kdb.desc.args.z)
    );