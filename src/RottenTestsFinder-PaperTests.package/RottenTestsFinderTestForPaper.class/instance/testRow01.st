tests
testRow01
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow01HelperExecutedAssertionExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty