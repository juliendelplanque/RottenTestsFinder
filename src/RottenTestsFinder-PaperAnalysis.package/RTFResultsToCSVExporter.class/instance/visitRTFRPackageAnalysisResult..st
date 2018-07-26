visiting
visitRTFRPackageAnalysisResult: aRTFRPackageAnalysisResult
	self currentPackageName: aRTFRPackageAnalysisResult package name.
	(aRTFRPackageAnalysisResult testCaseClassesAnalysisResults sorted: [ :a :b | a testCaseClass name < b testCaseClass name ])
		do: [ :testCaseClassesAnalysis | testCaseClassesAnalysis acceptVisitor: self ]