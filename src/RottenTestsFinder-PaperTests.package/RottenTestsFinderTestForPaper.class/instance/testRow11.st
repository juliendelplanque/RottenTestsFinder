tests
testRow11
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow11HelperExecutedAssertionNotExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFAbstractTestCaseForPaper
				and: [ m selector = #rottenHelper ] ])