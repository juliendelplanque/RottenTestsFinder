visiting
visitTestCaseClass: aTestCaseClass
	^ RTFRTestCaseClassAnalysisResult new
		testCaseClass: aTestCaseClass;
		testCaseAnalysisResults: (self privateVisitTestCaseClass: aTestCaseClass);
		yourself