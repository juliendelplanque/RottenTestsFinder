tests
testSimple
	| interpreter |
	interpreter := RTFSelfCallInterpreter new.
	
	interpreter considerClassesThat: [ :class | class inheritsFrom: TestAsserter ].

	interpreter send: #testFailingButNotConsideredAsRotten fromClass: RTFFakeTestClass.

	self
		assert: interpreter selfSentMethods isEmpty