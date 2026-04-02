/ ==================================================
/ analyze load functions
/ ==================================================

/ --------------------------------------------------
/ convert path input to file handle
/ --------------------------------------------------
.analyze.load.toHandle:{[filePath]
  hsym `$ filePath
 };

/ --------------------------------------------------
/ load script and return handle
/ --------------------------------------------------
.analyze.load.script:{[filePath]
  fileHandle:.analyze.load.toHandle filePath;
  system "l ",string fileHandle;
  fileHandle
 };

/ --------------------------------------------------
/ read raw script text
/ --------------------------------------------------
.analyze.load.text:{[filePath]
  fileHandle:.analyze.load.toHandle filePath;
  read0 fileHandle
 };

/ --------------------------------------------------
/ return script text as one char vector
/ --------------------------------------------------
.analyze.load.textString:{[filePath]
  raze .analyze.load.text filePath
 };