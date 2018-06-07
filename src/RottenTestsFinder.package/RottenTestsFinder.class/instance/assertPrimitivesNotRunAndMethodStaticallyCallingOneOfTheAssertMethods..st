private-testing
assertPrimitivesNotRunAndMethodStaticallyCallingOneOfTheAssertMethods: compiledMethod
	^ (tracers noneSatisfy: [ :tracer | tracer hasRun ]) and: [ compiledMethod isStaticallyCallingOneOfTheAssertMethods ]