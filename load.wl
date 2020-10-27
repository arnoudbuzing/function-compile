home = DirectoryName @ $InputFileName;
libdir = FileNameJoin[{ home, "lib", ToString[$VersionNumber], $SystemID }];
files = FileNames[ "*", libdir ];

Scan[
 Function[{file},
  Print[file];
  string = "c`" <> StringJoin[Capitalize[StringSplit[FileBaseName[file], "-"]]];
  With[{s = ToExpression[string, StandardForm, Unevaluated]}, s = LibraryFunctionLoad[file] ];
 ],
 files
]
