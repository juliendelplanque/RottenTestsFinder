tests
testWithHelper
	| interpreter |
	interpreter := RTFSelfCallInterpreter new.
	
	interpreter considerClassesThat: [ :class | class inheritsFrom: TestAsserter ].

	interpreter send: #testWithAssertionInHelperRun fromClass: RTFFakeTestClass.

	self
		assertCollection: interpreter selfSentMethods hasSameElements: { RTFFakeTestClass >> #assertHelper }