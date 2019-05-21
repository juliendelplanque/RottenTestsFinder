Class {
	#name : #RTFRPackageAnalysisResult,
	#superclass : #Object,
	#instVars : [
		'package',
		'testCaseClassesAnalysisResults'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #visiting }
RTFRPackageAnalysisResult >> acceptVisitor: aRTFAnalysisResultVisitor [
	^ aRTFAnalysisResultVisitor visitRTFRPackageAnalysisResult: self
]

{ #category : #accessing }
RTFRPackageAnalysisResult >> package [
	^ package
]

{ #category : #accessing }
RTFRPackageAnalysisResult >> package: anObject [
	package := anObject
]

{ #category : #accessing }
RTFRPackageAnalysisResult >> testCaseClassesAnalysisResults [
	^ testCaseClassesAnalysisResults
]

{ #category : #accessing }
RTFRPackageAnalysisResult >> testCaseClassesAnalysisResults: anObject [
	testCaseClassesAnalysisResults := anObject
]
