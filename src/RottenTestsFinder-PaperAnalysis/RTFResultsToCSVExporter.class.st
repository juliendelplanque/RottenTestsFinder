Class {
	#name : #RTFResultsToCSVExporter,
	#superclass : #RTFAnalysisResult,
	#instVars : [
		'neoCSV',
		'currentPackageName',
		'currentClassName'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #csv }
RTFResultsToCSVExporter >> addHeader [
	self neoCSV
		nextPut: #(
			'Package'
			'Method'
			'Max helper depth'
			'Primitives calls in test count'
			'All primitives calls involved in execution count'
			'Not-executed #assert: getting false literal as parameter'
			'Helpers calls in test count'
			'All helpers calls involved in execution count'
			'Test contains return'
			'Context dependent rotten assert count'
			'Is rotten'
			'Test case depth')
]

{ #category : #accessing }
RTFResultsToCSVExporter >> currentClassName [
	^ currentClassName
]

{ #category : #accessing }
RTFResultsToCSVExporter >> currentClassName: anObject [
	currentClassName := anObject
]

{ #category : #accessing }
RTFResultsToCSVExporter >> currentPackageName [
	^ currentPackageName
]

{ #category : #accessing }
RTFResultsToCSVExporter >> currentPackageName: anObject [
	currentPackageName := anObject
]

{ #category : #accessing }
RTFResultsToCSVExporter >> neoCSV [
	^ neoCSV
]

{ #category : #accessing }
RTFResultsToCSVExporter >> neoCSV: anObject [
	neoCSV := anObject
]

{ #category : #visiting }
RTFResultsToCSVExporter >> visitRTFRPackageAnalysisResult: aRTFRPackageAnalysisResult [
	self currentPackageName: aRTFRPackageAnalysisResult package name.
	(aRTFRPackageAnalysisResult testCaseClassesAnalysisResults sorted: [ :a :b | a testCaseClass name < b testCaseClass name ])
		do: [ :testCaseClassesAnalysis | testCaseClassesAnalysis acceptVisitor: self ]
]

{ #category : #visiting }
RTFResultsToCSVExporter >> visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult [
	self neoCSV
		nextPut: { 
			self currentPackageName.
			aRTFTestCaseAnalysisResult testCase class name , '>>' , aRTFTestCaseAnalysisResult testCase selector  .
			aRTFTestCaseAnalysisResult helperMaxDepth. "prof max"
			aRTFTestCaseAnalysisResult firstLevelPrimitivesCalls size. "# helpers sur le premier niveau"
			aRTFTestCaseAnalysisResult primitivesCalls size. "# assert impliqués dans l'execution"
			aRTFTestCaseAnalysisResult assertCallSitesGettingFalseLiteral size.
			aRTFTestCaseAnalysisResult firstLevelHelperCalls size. "# helpers sur le premier niveau"
			aRTFTestCaseAnalysisResult helperCalls size. "# helpers impliqués dans l'execution"
			aRTFTestCaseAnalysisResult testContainsReturn.
			aRTFTestCaseAnalysisResult contextDependentRottenAsserts size.
			aRTFTestCaseAnalysisResult isRotten. "is rotten?"
			aRTFTestCaseAnalysisResult testCase class classDepth - TestCase classDepth "Class depth"
		}
]

{ #category : #visiting }
RTFResultsToCSVExporter >> visitRTFTestCaseClassAnalysisResult: aRTFTestCaseClassAnalysisResult [
	self currentClassName: aRTFTestCaseClassAnalysisResult testCaseClass name.
	(aRTFTestCaseClassAnalysisResult testCaseAnalysisResults sorted: [ :a :b | a testCase selector < b testCase selector ])
		do: [ :testCaseAnalysisResult | testCaseAnalysisResult acceptVisitor: self ]
]
