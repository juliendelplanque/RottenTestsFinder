tests
testRow07
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion
				and: [ m selector = #test ] ])