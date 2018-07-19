testing
isCallToAssertPrimitive
	"Returns true if the CompiledMethod I hold is an assertion primitive."
	^ RottenTestsFinder assertionCompiledMethods includes: self compiledMethod