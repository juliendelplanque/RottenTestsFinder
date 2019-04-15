accessing
assertionCompiledMethods
	"Returns the list of CompiledMethods used to assert things during tests."
	^ ((Object methodsInProtocol: 'asserting') , (TestAsserter methodsInProtocol: 'asserting')
			collect: [ :o | 
				o class = RTFMethodTracer
					ifTrue: [ o method ]
					ifFalse: [ o ] ])
			reject: [ :compiledMethod |
				#(#fail: #fail #signalFailure: #skip #skip:) includes: compiledMethod selector ]