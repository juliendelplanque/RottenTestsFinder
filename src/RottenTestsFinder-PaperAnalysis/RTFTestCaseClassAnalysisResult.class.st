Class {
	#name : #RTFTestCaseClassAnalysisResult,
	#superclass : #Object,
	#instVars : [
		'testCaseAnalysisResults',
		'testCaseClass'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #visiting }
RTFTestCaseClassAnalysisResult >> acceptVisitor: aRTFAnalysisResultVisitor [
	^ aRTFAnalysisResultVisitor visitRTFTestCaseClassAnalysisResult: self
]

{ #category : #printing }
RTFTestCaseClassAnalysisResult >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(.
	self testCaseClass printOn: aStream.
	aStream
		<< $).
]

{ #category : #accessing }
RTFTestCaseClassAnalysisResult >> testCaseAnalysisResults [
	^ testCaseAnalysisResults
]

{ #category : #accessing }
RTFTestCaseClassAnalysisResult >> testCaseAnalysisResults: anObject [
	testCaseAnalysisResults := anObject
]

{ #category : #accessing }
RTFTestCaseClassAnalysisResult >> testCaseClass [
	^ testCaseClass
]

{ #category : #accessing }
RTFTestCaseClassAnalysisResult >> testCaseClass: anObject [
	testCaseClass := anObject
]
