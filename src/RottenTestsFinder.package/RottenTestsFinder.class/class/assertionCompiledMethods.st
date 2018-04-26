accessing
assertionCompiledMethods
	"Returns the list of CompiledMethods used to assert things during tests."
	^ (TestAsserter methodsInProtocol: 'asserting') reject: [ :compiledMethod |
		#(#fail: #fail #signalFailure:) includes: compiledMethod selector ]