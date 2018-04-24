visiting
visitTestCase: aTestCase
		"1. Reset tracers flags."
		tracers do: [ :tracer | tracer unmark ].
		"2. Run the test."
		aTestCase run.
		"3. If test does not call an assertion method at run time
		    but has a reference to one of them, add it to results."
		((tracers noneSatisfy: [ :tracer | tracer hasRun ])
			and: [ (aTestCase class >> aTestCase selector) isStaticallyCallingOneOfTheAssertMethods ])
				ifTrue: [ rottenTests add: (aTestCase class >> aTestCase selector) ]