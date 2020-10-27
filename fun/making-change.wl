Function[{Typed[n, "MachineInteger"]},
 Module[{Typed[c, "DynamicArray"] = CreateDataStructure["DynamicArray"], t, r1, r2},
  Do[c["Append", 1], n + 1];
  t = c["Copy"];
  Do[
   Do[
    r1 = Range[i + 1, n + 1];
    r2 = Range[1, n + 1 - i];
    Do[
     t["SetPart", r1[[j]],
     t["Part", r1[[j]]] + c["Part", r2[[j]]]], {j, 1, Length[r1]}
    ],
    {i, k, n, k}
   ];
   c = t["Copy"],
   {k, {2, 5, 10}}
  ];
  Normal[c]
 ]
]
