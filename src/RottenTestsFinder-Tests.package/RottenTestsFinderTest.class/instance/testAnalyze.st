tests-analyzing
testAnalyze
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFFakeTestClass suite.
	
	self
		assert: rottenTestsFound size equals: 1;
		assert: rottenTestsFound first equals: (RTFFakeTestClass >> #testWithoutAssertionRun)