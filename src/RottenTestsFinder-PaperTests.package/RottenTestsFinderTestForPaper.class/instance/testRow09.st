tests
testRow09
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow09HelperExecutedAssertionExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty