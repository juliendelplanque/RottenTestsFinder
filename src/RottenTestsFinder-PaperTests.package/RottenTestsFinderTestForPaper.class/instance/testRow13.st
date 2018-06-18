tests
testRow13
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow13HelperExecutedAssertionExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty