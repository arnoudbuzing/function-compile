home = DirectoryName @ $InputFileName;
files = FileNames[ "*.wl", FileNameJoin[{ home, "fun"}] ];

libdir = FileNameJoin[{ home, "lib", ToString[$VersionNumber], $SystemID }];
If[ FileType[libdir] =!= Directory, CreateDirectory[libdir, CreateIntermediateDirectories -> True] ];

Scan[
 Function[{file},
  lib = FileNameJoin[ { libdir, FileBaseName[file]<>".dll" } ];
  WriteString[$Output, StringPadRight[ FileBaseName @ lib, 40 ] <> "\t"];
  fun = Get[file];
  timing = First @ AbsoluteTiming @ FunctionCompileExportLibrary[lib, fun];
  WriteString[$Output, StringPadLeft[ ToString @ Round[ 1000*timing ], 10] <> "\n"];
 ],
 files
]
