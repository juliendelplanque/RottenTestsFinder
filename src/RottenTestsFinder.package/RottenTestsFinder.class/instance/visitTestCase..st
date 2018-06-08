private-visiting
visitTestCase: aTestCase
	| compiledMethod |
	compiledMethod := (aTestCase class whichClassIncludesSelector: aTestCase selector) >> aTestCase selector.
	(RTFMethodTracersSet onCompiledMethods: compiledMethod methodClass testHelperMethods)
		whileTracersAreInstalledDo: [ :methodTracersSet |
			"1. Reset tracers flags."
			primitiveAssertionsTracersSet unmarkAll.
			methodTracersSet unmarkAll.
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
					(self assertPrimitivesNotRunAndHelperMethodsNotRun: methodTracersSet)
						ifTrue: [ 
							rottenTests add: (RottenTestHelper compiledMethod: compiledMethod testHelperCompiledMethods: methodTracersSet compiledMethodsForTracersRun) ] ].
			RTFTestAnalysed signalTest: compiledMethod ]