visiting
visitTestCase: aTestCase
	| compiledMethod helpers |
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	helpers := (RTFSelfCallInterpreter new
					considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
					send: compiledMethod selector fromClass: compiledMethod methodClass;
					rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive allCompiledMethods \ { compiledMethod }.
	helpers := (helpers \ self class assertionCompiledMethods) asArray.
	(RTFMethodTracersSet onCompiledMethods: helpers)
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
			containsHelper := helpers isNotEmpty.
			assertionPrimitiveExecuted := primitiveAssertionsTracersSet anyTracerHasRun.
			helperExecuted := (helperMethodsTracersSet compiledMethodsForTracersRun intersection: helpers) isNotEmpty.
			
			"Cases 1-4 in the paper:"
			(containsassertionPrimitive and: [ containsHelper and: [ (assertionPrimitiveExecuted and: [ helperExecuted ]) not ] ])
				ifTrue: [ rottenTests addCompiledMethod: compiledMethod ].
			
			"Cases 7-8 in the paper:"
			(containsassertionPrimitive and: [ (containsHelper not) and: [ assertionPrimitiveExecuted not ] ])
				ifTrue: [ rottenTests addCompiledMethod: compiledMethod ].
				
			"Case 11 in the paper:"
			(containsassertionPrimitive not and: [ containsHelper and: [ assertionPrimitiveExecuted not and: [ helperExecuted ] ] ])
				ifTrue: [ rottenTests add: (RottenTestHelper compiledMethod: compiledMethod testHelperCompiledMethods: helperMethodsTracersSet compiledMethodsForTracersRun) ].
				
			"Cases 10 and 12 in the paper:"
			(containsassertionPrimitive not and: [ containsHelper and: [ helperExecuted not ] ])
				ifTrue: [ rottenTests addCompiledMethod: compiledMethod ].
			"Halt if: [ compiledMethod selector = #test ]."
			RTFTestAnalysed signalTest: compiledMethod ]