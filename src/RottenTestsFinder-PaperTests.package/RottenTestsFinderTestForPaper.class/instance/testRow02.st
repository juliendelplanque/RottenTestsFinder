tests
testRow02
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion
				and: [ m selector = #test ] ])