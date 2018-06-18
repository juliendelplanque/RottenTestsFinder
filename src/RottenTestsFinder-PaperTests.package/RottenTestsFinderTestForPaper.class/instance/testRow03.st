tests
testRow03
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion >> #test }