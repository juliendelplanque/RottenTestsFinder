Class {
	#name : #RTFAnalysisResult,
	#superclass : #Object,
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #visiting }
RTFAnalysisResult >> visitRTFRPackageAnalysisResult: aRTFRPackageAnalysisResult [
	^ self subclassResponsibility
]

{ #category : #visiting }
RTFAnalysisResult >> visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult [
	^ self subclassResponsibility
]

{ #category : #visiting }
RTFAnalysisResult >> visitRTFTestCaseClassAnalysisResult: aRTFTestCaseClassAnalysisResult [
	^ self subclassResponsibility
]
