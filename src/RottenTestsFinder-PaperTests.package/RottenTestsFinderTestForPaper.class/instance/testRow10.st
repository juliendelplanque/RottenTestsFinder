tests
testRow10
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion >> #test }