tests-analyzing
testAnalyze
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyzeCase: RTFFakeTestClass.
	
	self
		assert: rottenTestsFound size equals: 1;
		assert: rottenTestsFound first equals: (RTFFakeTestClass >> #testWithoutAssertionRun)