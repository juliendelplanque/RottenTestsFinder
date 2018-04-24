accessing
assertionSelectors
	"Returns the list of selectors corresponding to methods used to assert things during tests."
	^ self assertionCompiledMethods collect: #selector