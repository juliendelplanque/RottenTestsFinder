private
runTests
	rottenTests := OrderedCollection new.
	self testCase testSelectors do: [ :testSelector |
		"1. Reset tracers flags."
		tracers do: [ :tracer | tracer unmark ].
		"2. Run the test."
		self testCase run: testSelector.
		"3. If test does not call an assertion method at run time
		    but has a reference to one of them, add it to results.
		"
		((tracers noneSatisfy: [ :tracer | tracer hasRun ])
			and: [ (self testCase >> testSelector) isStaticallyCallingOneOfTheAssertMethods ])
				ifTrue: [ rottenTests add: self testCase >> testSelector ] ]