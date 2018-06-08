private-visiting
visitTestCase: aTestCase
	| compiledMethod |
	compiledMethod := (aTestCase class whichClassIncludesSelector: aTestCase selector) >> aTestCase selector.
	self
		withTracersOnHelperMethodsOf: compiledMethod methodClass
		do: [ :helperMethodsTracers |
			"1. Reset tracers flags."
			tracers do: [ :tracer | tracer unmark ].
			helperMethodsTracers do: [ :tracer | tracer unmark ].
			"2. Run the test."
			aTestCase run hasPassed
				ifFalse: [ "If the test is not green, no need to continue analysis."
					RTFTestAnalysed signalTest: compiledMethod.
					^ self ].
			
	
			"If class is abstract test, do not add it to results."
			compiledMethod methodClass isAbstract
				ifTrue: [ 
					RTFTestAnalysed signalTest: compiledMethod.
					^ self ].
			"3. If test does not call an assertion method at run time
		    but has a reference to one of them, add it to results."
			(self assertPrimitivesNotRunAndMethodStaticallyCallingOneOfTheAssertMethods: compiledMethod)
				ifTrue: [ rottenTests addCompiledMethod: compiledMethod ]
				ifFalse: [ 
					(self assertPrimitivesNotRunAndHelperMethodsNotRun: helperMethodsTracers)
						ifTrue: [ |testHelperCompiledMethodsRun|
							testHelperCompiledMethodsRun := helperMethodsTracers select: [ :tracer | tracer hasRun ] thenCollect: [ :tracer | tracer method ].
							rottenTests add: (RottenTestHelper compiledMethod: compiledMethod testHelperCompiledMethods: testHelperCompiledMethodsRun) ] ].
			RTFTestAnalysed signalTest: compiledMethod ]