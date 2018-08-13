visiting
visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult
	| testSelector testClass selfCallTree parentToHelpers |
	testSelector := aRTFTestCaseAnalysisResult testCase selector.
	testClass := aRTFTestCaseAnalysisResult testCase class.
	selfCallTree := [ RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: testSelector fromClass: testClass;
							rootSelfCall ] on: Warning do: #resume.
	selfCallTree cleanSubTreesNotLeadingToAssertPrimitive.
	
	parentToHelpers := RTFHelperAndParentCollector new
								visitRTFSelfCallRootNode: selfCallTree;
								parentHelperPairs.
								
	parentToHelpers do: [ :parentToHelper |
		self neoCSV nextPut: { 
			parentToHelper value printString.
			parentToHelper value methodClass classDepth - parentToHelper key methodClass classDepth.
			parentToHelper key printString } ]