analyzing
analyze
	primitiveAssertionsTracersSet := RTFMethodTracersSet onCompiledMethods: self assertionCompiledMethods.
	primitiveAssertionsTracersSet whileTracersAreInstalledDo: [ self runTests ]