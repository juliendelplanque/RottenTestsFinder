visiting
visitRTFTestCaseClassAnalysisResult: aRTFTestCaseClassAnalysisResult
	self currentClassName: aRTFTestCaseClassAnalysisResult testCaseClass name.
	(aRTFTestCaseClassAnalysisResult testCaseAnalysisResults sorted: [ :a :b | a testCase selector < b testCase selector ])
		do: [ :testCaseAnalysisResult | testCaseAnalysisResult acceptVisitor: self ]