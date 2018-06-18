tests
testRow16
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow16HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty