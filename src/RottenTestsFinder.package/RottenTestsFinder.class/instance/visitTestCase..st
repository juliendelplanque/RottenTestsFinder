private-visiting
visitTestCase: aTestCase
	| compiledMethod testHelperMethods|
	compiledMethod := (aTestCase class whichClassIncludesSelector: aTestCase selector) >> aTestCase selector.
	
	"0. Install tracers on non-test methods calling an assert-like method."
	testHelperMethods := compiledMethod origin testHelperMethods.
	helperMethodsTracers := testHelperMethods collect: [ :method |
		RTFMethodTracer on: method ].
	helperMethodsTracers do:  [:tracer | tracer install ].
	"1. Reset tracers flags."
	tracers do: [ :tracer | tracer unmark ].
	"2. Run the test."
	aTestCase run.
	"3. If test does not call an assertion method at run time
		    but has a reference to one of them, add it to results."
	
	"If class is abstract test, do not add it to results."
	compiledMethod methodClass isAbstract
		ifTrue: [ 
			RTFTestAnalysed signalTest: compiledMethod.
			^ self ].
	
	((tracers noneSatisfy: [ :tracer | tracer hasRun ]) and: [ compiledMethod isStaticallyCallingOneOfTheAssertMethods ])
		ifTrue: [ rottenTests addCompiledMethod: compiledMethod ]
		ifFalse: [ 
			((tracers noneSatisfy: [ :tracer | tracer hasRun ]) and: [ helperMethodsTracers anySatisfy: [ :tracer | tracer hasRun ] ])
				ifTrue: [ 
					rottenTests add: (RottenTestHelper new
												compiledMethod: compiledMethod;
												testHelperCompiledMethods: (helperMethodsTracers select: [ :tracer | tracer hasRun ] thenCollect: [ :tracer | tracer method ])) ] ].
	
	"4. Uninstall tracers on helper methods and clean the list."
	helperMethodsTracers do: [ :tracer | tracer uninstall ].
	helperMethodsTracers := #().
	
	RTFTestAnalysed signalTest: compiledMethod