tests
testRow12
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow12HelperNotExecutedAssertionNotExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assertCollection: rottenTestsFound rottenCompiledMethods hasSameElements: { RTFRow12HelperNotExecutedAssertionNotExecutedContainsHelperContainsNoAssertion >> #test }