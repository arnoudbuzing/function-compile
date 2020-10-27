home = DirectoryName @ $InputFileName;
files = FileNames[ "*.wl", FileNameJoin[{ home, "functions"}] ];

libdir = FileNameJoin[{ home, "lib", ToString[$VersionNumber], $SystemID }];
If[ FileType[libdir] =!= Directory, CreateDirectory[libdir, CreateIntermediateDirectories -> True] ];

Scan[
 Function[{file},
  lib = FileNameJoin[ { libdir, FileBaseName[file]<>".dll" } ];
  WriteString[$Output, lib <> "\t"];
  fun = Get[file];
  timing = First @ AbsoluteTiming @ FunctionCompileExportLibrary[lib, fun];
  WriteString[$Output, ToString @ timing <> "\n"];
 ],
 files
]
