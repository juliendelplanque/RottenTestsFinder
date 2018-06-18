tests
testRow07
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion >> #test }