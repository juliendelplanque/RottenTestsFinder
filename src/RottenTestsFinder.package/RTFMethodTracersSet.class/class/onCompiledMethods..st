instance creation
onCompiledMethods: aCollectionOfCompiledMethods self halt.
	^ self new
		tracers: (aCollectionOfCompiledMethods collect: [ :compiledMethod | RTFMethodTracer on: compiledMethod ]);
		yourself