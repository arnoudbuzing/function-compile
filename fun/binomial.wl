Function[{Typed[n, "MachineInteger"], Typed[k, "MachineInteger"]},
 Quotient[
  Typed[KernelFunction[c`Factorial], {"MachineInteger"} -> "MachineInteger"][n]
  , 
  Typed[KernelFunction[c`Factorial], {"MachineInteger"} -> "MachineInteger"][k] *
  Typed[KernelFunction[c`Factorial], {"MachineInteger"} -> "MachineInteger"][n - k]
 ]
]
