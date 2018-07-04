instance creation
compiledMethod: aCompiledMethod classRun: aClass
	^ self new
		compiledMethod: aCompiledMethod;
		classRun: aClass;
		yourself