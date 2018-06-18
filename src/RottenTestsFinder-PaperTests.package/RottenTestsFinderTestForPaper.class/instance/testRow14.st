tests
testRow14
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow14HelperNotExecutedAssertionExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty