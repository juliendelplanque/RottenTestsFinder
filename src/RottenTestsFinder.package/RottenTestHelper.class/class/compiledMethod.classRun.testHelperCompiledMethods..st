instance creation
compiledMethod: compiledMethod classRun: aClass testHelperCompiledMethods: testHelperCompiledMethodsRun
	^ (self compiledMethod: compiledMethod classRun: aClass)
			testHelperCompiledMethods: testHelperCompiledMethodsRun;
			yourself