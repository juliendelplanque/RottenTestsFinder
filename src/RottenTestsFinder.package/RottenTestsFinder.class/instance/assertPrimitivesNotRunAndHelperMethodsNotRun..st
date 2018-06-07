private-testing
assertPrimitivesNotRunAndHelperMethodsNotRun: helperMethodsTracers
	^ (tracers noneSatisfy: [ :tracer | tracer hasRun ]) and: [ helperMethodsTracers anySatisfy: [ :tracer | tracer hasRun ] ]