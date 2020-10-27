Function[{Typed[list, TypeSpecifier["PackedArray"]["MachineInteger", 1]]},
 Module[{i = 1, s = 1, result = CreateDataStructure["DynamicArray"]},
  While[i < Length[list],
   If[list[[i + 1]] - list[[i]] != 1, result["Append", {list[[s]], list[[i]]}]; s = i + 1];
   i = i + 1;
  ];
  result["Append", {list[[s]], list[[i]]}];
  Normal[result]
 ]
]
