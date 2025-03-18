// INFO ====================================================
// Purpose: Script used by other utilities or dictionaries to
//==========================================================
/ Descriptions of different overloads or overloaded glyphs

// Author: Spencer
//==========================================================
.kdb.desc.overloads.find:"? - x?y - where x is a list or a null, returns for atom y the smallest index of y, list y the smallest index of each item of y. . Comparisons are exact and are not subject to to comparison tolerance. Find is a multittreaded-primitive. Simple list and y a list whose atoms are all the same type as x, and whose first item is a list, the result corresponds to y item-by-item; i.e. Find is right-atomic. List of lists and y is a simple list, items of x are matched with the whole of y. ? can also be used to search through tables with a compatible record of dictionry or list format.";

.kdb.desc.overloads.roll:"? - x?y - Select items randomly, generate random values, where x is an integer atom and y is a list. Returns abs[x] randomly selected items of y where x is positive: positive items are selected independently (roll), negative and x>=neg count y, items are selected from different indexes of y (deal)";

.kdb.desc.overloads.permute:"? - 0N?x - Where x is a non-negative int atom, returns the items of til x in random order, a list, returns the items of x in random order.";

.kdb.desc.overloads.enumExtend:"? - x?y or ?[x;y] - Extend an enumeration. Where y is a list and x is a handle to a: Variable: fills in any missing items in x, then returns y as an enumeration of it. (Unlike Enumerate.). Filepath - fills in any missing items in file x, loads it into the session as a variable of the same name, and returns y as an enumeration of it. Note that ? preserves the attribute/s of the right-argument but $ does not.";

.kdb.desc.overloads.simpleExec:"? - ?[t;i;p] - functional exec";

.kdb.desc.overloads.select:"? - ?[t;c;b;a;n] - Limit result rows";

.kdb.desc.overloads.vectorConditional:"?[x;y;z] - Replace selected items of one list with corresponding items of another. Where x is a boolean vector, y and z are lists of the same type, x, y, and z conform and returns a new list by replacing elements of y with the elements of z when x is false.";

.kdb.desc.overloads.indexAt:"The selections at each level are individual applications of Index At: first, item d@i[0] is selected, then (d@i[0])@i[1], then ((d@i[0])@ i[1])@ i[2], and so on. These expressions can be rewritten using Over applied to Index At; the first is d@/i[0], the second is d@/i[0 1], and the third is d@/i[0 1 2]. In general, for a vector i of any count, d . i is identical to d@/i.";

.kdb.desc.overloads.applyAt:"@ is syntactic sugar for the case where u is a unary and ux a 1-item list. u@ux is always equivalent to u . enlist ux. The brackets of an argument list are also syntactic sugar. Nothing can be expressed with brackets that cannot also be expressed using .. You can use the derived function @ backslash : to apply a list of unary values to the same argument.";

.kdb.desc.overloads.trapAt:"Use Trap At as a simpler form of Trap, for unary values. If the expression is a function, it is evaluated on the text of the signalled error. For a successful evaluation, the ternary returns the same result as the binary.";

.kdb.desc.overloads.amendAt:"Modify one or more items in a list, dictionary or datafile. Indices results are accumulated when repeated. @[d; i; u] - Where d is an atom, list, or a dictionary (value); or a handle to a list, dictionary or datafile, i indexes where d is to be amended: it must be a list for . if empty (for .) or the general null :: (for @), or if d is a non-handle atom, the selection is d (Amend Entire), otherwise is .[d;i] or @[d;i] u is a unary, v is a binary, and vy is in the right domain of v unless is d, conformable to and of the same type the items in d of the selection are replaced in the ternary, by u[] for . and by u'[] for @ in the quaternary, by v[;vy] for . and by v'[;vy] for @and if d is a value, returns a copy of it with the item/s at i modified handle, modifies the item/s of its reference at i, and returns the handle";

.kdb.desc.overloads.replaceAt:"@[d; i; :; y] replacement.";

.kdb.desc.overloads.dotIndex:"v . vx evaluates value v on the arguments listed in vx.";

.kdb.desc.overloads.dotApply:"v . vx evaluates value v on the arguments listed in vx.";

.kdb.desc.overloads.dotTrap:"In the ternary, if evaluation of the function fails, the expression is evaluated. (Compare try/catch in some other languages.). If the expression is a function, it is evaluated on the text of the signalled error. For a successful evaluation, the ternary returns the same result as the binary.";

.kdb.desc.overloads.dotAmend:"Dot Amend - .[d;i;m;my] - If i is the empty list (for .), the general null (for @), the selection is the entire value in d.";

.kdb.desc.overloads.dotReplace:"Dot replace - .[d;i;:;y] - Ability to replace at index";

.kdb.desc.overloads.cond:"Conditional evaluation - $[test;et;ef;…]";

.kdb.desc.overloads.cast:"\"h\"$y, `short$y, 11h$y";

.kdb.desc.overloads.tok:"A left argument of 0h or asterisk in quotes returns the y string unchanged. Where x is a positive or zero short, a lower-case char, asterisk in quotes, or a non-null symbol, see Cast.";

.kdb.desc.overloads.enumerate:"Where x is a symbol containing the name of a global variable d, d is a list,y is a list,d~distinct d,,items of y are all items of d,returns y as an enumeration of d, using x as the name of the enumeration domain. Values are stored as indices and so need less space.";

.kdb.desc.overloads.pad:"Add extra-space to strings";