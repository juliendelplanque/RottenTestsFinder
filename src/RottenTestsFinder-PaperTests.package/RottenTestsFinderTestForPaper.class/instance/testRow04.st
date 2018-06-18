tests
testRow04
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion >> #test }