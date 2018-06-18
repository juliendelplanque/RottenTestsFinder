tests
testRow08
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow08HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow08HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsAssertion >> #test }