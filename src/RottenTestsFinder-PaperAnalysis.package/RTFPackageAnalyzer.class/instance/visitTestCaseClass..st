visiting
visitTestCaseClass: aTestCaseClass
	^ RTFTestCaseClassAnalysisResult new
		testCaseClass: aTestCaseClass;
		testCaseAnalysisResults: (self privateVisitTestCaseClass: aTestCaseClass);
		yourself