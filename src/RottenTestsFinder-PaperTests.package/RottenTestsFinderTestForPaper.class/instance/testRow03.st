tests
testRow03
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 2;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion
				and: [ m selector = #test ] ]);
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFAbstractTestCaseForPaper
				and: [ m selector = #rottenHelper ] ])