visiting
visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult
	self neoCSV
		nextPut: { 
			self currentPackageName.
			aRTFTestCaseAnalysisResult testCase .
			aRTFTestCaseAnalysisResult helperMaxDepth. "prof max"
			aRTFTestCaseAnalysisResult firstLevelPrimitivesCalls size. "# helpers sur le premier niveau"
			aRTFTestCaseAnalysisResult primitivesCalls size. "# assert impliqués dans l'execution"
			aRTFTestCaseAnalysisResult assertCallSitesGettingFalseLiteral size.
			aRTFTestCaseAnalysisResult firstLevelHelperCalls size. "# helpers sur le premier niveau"
			aRTFTestCaseAnalysisResult helperCalls size. "# helpers impliqués dans l'execution"
			aRTFTestCaseAnalysisResult testContainsReturn.
			aRTFTestCaseAnalysisResult contextDependentRottenAsserts size.
			aRTFTestCaseAnalysisResult isRotten. "is rotten?"
			aRTFTestCaseAnalysisResult testCase origin classDepth - TestCase classDepth "Class depth"
		}