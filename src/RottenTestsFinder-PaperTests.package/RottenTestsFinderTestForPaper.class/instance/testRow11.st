tests
testRow11
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow11HelperExecutedAssertionNotExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow11HelperExecutedAssertionNotExecutedContainsHelperContainsNoAssertion >> #test }