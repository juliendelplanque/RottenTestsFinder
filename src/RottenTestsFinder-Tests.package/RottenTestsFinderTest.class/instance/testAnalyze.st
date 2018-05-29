tests-analyzing
testAnalyze
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFFakeTestClass suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: rottenTestsFound rottenTests anyOne compiledMethod equals: (RTFFakeTestClass >> #testWithoutAssertionRun)