tests
testRow15
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow15HelperExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty