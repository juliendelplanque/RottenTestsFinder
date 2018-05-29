private-visiting
visitTestCase: aTestCase
	| compiledMethod |
	"1. Reset tracers flags."
	tracers do: [ :tracer | tracer unmark ].
	"2. Run the test."
	aTestCase run.
	"3. If test does not call an assertion method at run time
		    but has a reference to one of them, add it to results."
	compiledMethod := (aTestCase class whichClassIncludesSelector: aTestCase selector) >> aTestCase selector.
	
	"If class is abstract test, do not add it to results."
	compiledMethod methodClass isAbstract
		ifTrue: [ ^ self ].
	
	((tracers noneSatisfy: [ :tracer | tracer hasRun ]) and: [ compiledMethod isStaticallyCallingOneOfTheAssertMethods ])
		ifTrue: [ rottenTests addCompiledMethod: compiledMethod ]