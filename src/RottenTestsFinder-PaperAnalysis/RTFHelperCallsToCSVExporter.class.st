Class {
	#name : #RTFHelperCallsToCSVExporter,
	#superclass : #RTFResultsToCSVExporter,
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #csv }
RTFHelperCallsToCSVExporter >> addHeader [
	self neoCSV
		nextPut: #(
			'Helper called'
			'Helper called definition level'
			'Holding method')
]

{ #category : #visiting }
RTFHelperCallsToCSVExporter >> visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult [
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
]
