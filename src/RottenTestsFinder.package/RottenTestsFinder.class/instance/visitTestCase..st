visiting
visitTestCase: aTestCase
	| compiledMethod |
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	(RTFMethodTracersSet onCompiledMethods: compiledMethod methodClass testHelperMethods)
		whileTracersAreInstalledDo: [ :helperMethodsTracersSet |
			|helperExecuted assertionPrimitiveExecuted containsHelper containsassertionPrimitive|
			"1. Reset tracers flags."
			primitiveAssertionsTracersSet unmarkAll.
			helperMethodsTracersSet unmarkAll.
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
			"3. Add method to rotten tests set if classified as rotten."
			containsassertionPrimitive := compiledMethod assertionPrimitiveMethodsCalled isNotEmpty.
			containsHelper := (compiledMethod methodsCalledIn: helperMethodsTracersSet selectors) isNotEmpty. "This should be done transitively."
			assertionPrimitiveExecuted := primitiveAssertionsTracersSet anyTracerHasRun.
			helperExecuted := helperMethodsTracersSet anyTracerHasRun.

			(self assertPrimitivesNotRunAndMethodStaticallyCallingOneOfTheAssertMethods: compiledMethod)
				ifTrue: [ rottenTests addCompiledMethod: compiledMethod ]
				ifFalse: [ 
					(self assertPrimitivesNotRunAndHelperMethodsNotRun: helperMethodsTracersSet)
						ifTrue: [ 
							rottenTests add: (RottenTestHelper compiledMethod: compiledMethod testHelperCompiledMethods: helperMethodsTracersSet compiledMethodsForTracersRun) ] ].
			RTFTestAnalysed signalTest: compiledMethod ]