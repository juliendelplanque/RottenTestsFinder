tests
testCallingSuperHelper
	| interpreter |
	interpreter := RTFSelfCallInterpreter new.
	
	interpreter considerClassesThat: [ :class | class inheritsFrom: TestAsserter ].

	interpreter send: #testCallingSuperHelper fromClass: RTFFakeTestClass.

	self
		assertCollection: interpreter selfSentMethods hasSameElements: { RTFFakeTestSuperClass >> #superAssertHelper }