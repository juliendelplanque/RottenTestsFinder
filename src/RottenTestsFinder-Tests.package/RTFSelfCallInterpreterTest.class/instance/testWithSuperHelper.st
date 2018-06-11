tests
testWithSuperHelper
	| interpreter |
	interpreter := RTFSelfCallInterpreter new.
	
	interpreter considerClassesThat: [ :class | class inheritsFrom: TestAsserter ].

	interpreter send: #testWithAssertionInSuperWrapperRun fromClass: RTFFakeTestClass.

	self
		assertCollection: interpreter selfSentMethods hasSameElements: { RTFFakeTestSuperClass >> #superAssertWrapper }