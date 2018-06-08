private-testing
assertPrimitivesNotRunAndHelperMethodsNotRun: helperMethodsTracersSet
	^ primitiveAssertionsTracersSet noTracerHasRun
		and: [ helperMethodsTracersSet anyTracerHasRun ]