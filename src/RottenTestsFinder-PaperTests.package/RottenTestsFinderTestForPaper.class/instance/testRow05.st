tests
testRow05
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow05HelperExecutedAssertionExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty