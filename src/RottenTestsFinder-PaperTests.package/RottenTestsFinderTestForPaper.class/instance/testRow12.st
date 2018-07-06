tests
testRow12
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow12HelperNotExecutedAssertionNotExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow12HelperNotExecutedAssertionNotExecutedContainsHelperContainsNoAssertion
				and: [ m selector = #test ] ])