Function[{Typed[n, "MachineInteger"]}, Table[Quotient[Mod[n, 10^(i + 1)], 10^i], {i, Floor[Log10[N[n]]], 0, -1}]]
