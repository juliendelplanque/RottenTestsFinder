tests
testRow06
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow06HelperNotExecutedAssertionExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty