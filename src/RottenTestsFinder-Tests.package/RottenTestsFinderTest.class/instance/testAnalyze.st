tests-analyzing
testAnalyze
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFFakeTestClass suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 3;
		assertCollection: (rottenTestsFound rottenTests collect: #compiledMethod) hasSameElements: { RTFFakeTestClass >> #testWithoutAssertionRun . RTFFakeTestClass >> #testWithNoAssertionInWrapperRun . RTFFakeTestClass >> #testWithNoAssertionInSuperWrapperRun }