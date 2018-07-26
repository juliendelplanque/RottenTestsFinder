visiting
visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult
	self neoCSV
		nextPut: { 
			self currentPackageName.
			aRTFTestCaseAnalysisResult testCase .
			aRTFTestCaseAnalysisResult helperMaxDepth. "prof max"
			aRTFTestCaseAnalysisResult firstLevelPrimitivesCalls size. "# helpers sur le premier niveau"
			aRTFTestCaseAnalysisResult primitivesCalls size. "# helpers impliqués dans l'execution"
			aRTFTestCaseAnalysisResult firstLevelHelperCalls size. "# assert primitives sur le premier niveau"
			aRTFTestCaseAnalysisResult helperCalls size. "# assert impliqués dans l'execution"
			aRTFTestCaseAnalysisResult isRotten "is rotten?"
		}