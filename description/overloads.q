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

.kdb.desc.overloads.vectorConditional:"?[x;y;z] - Replace selected items of one list with corresponding items of another. Where x is a boolean vector, y and z are lists of the same type, x, y, and z conform."