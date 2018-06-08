instance creation
onCompiledMethods: aCollectionOfCompiledMethods
	^ self new
		tracers: (aCollectionOfCompiledMethods collect: [ :compiledMethod | RTFMethodTracer on: compiledMethod ]);
		yourself