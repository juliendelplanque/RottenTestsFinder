tests
testRow02
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion >> #test }