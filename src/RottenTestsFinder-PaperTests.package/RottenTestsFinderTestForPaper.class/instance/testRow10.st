tests
testRow10
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 2;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion
				and: [ m selector = #test ] ]);
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFAbstractTestCaseForPaper
				and: [ m selector = #goodHelper ] ])