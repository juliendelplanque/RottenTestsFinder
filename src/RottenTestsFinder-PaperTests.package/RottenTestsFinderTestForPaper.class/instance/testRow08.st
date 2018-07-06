tests
testRow08
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow08HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow08HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsAssertion
				and: [ m selector = #test ] ])