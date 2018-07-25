I model a node in the call tree built from a CompiledMethod.
I specifically model the root node of a call tree.

For this purpose, I store
- #compiledMethod : The CompiledMethod called.
- #subCalls : A collection of selfcall nodes.