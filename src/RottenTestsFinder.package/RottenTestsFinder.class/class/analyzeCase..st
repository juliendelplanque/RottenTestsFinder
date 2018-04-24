analyzing
analyzeCase: aTestCase
	^ self new
		testCase: aTestCase;
		analyze;
		rottenTests