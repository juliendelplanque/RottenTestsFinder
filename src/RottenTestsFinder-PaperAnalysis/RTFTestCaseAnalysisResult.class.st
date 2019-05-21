Class {
	#name : #RTFTestCaseAnalysisResult,
	#superclass : #Object,
	#instVars : [
		'testCase',
		'primitivesCalls',
		'firstLevelPrimitivesCalls',
		'helperCalls',
		'firstLevelHelperCalls',
		'maxDepth',
		'isRotten',
		'helpers',
		'testContainsReturn',
		'contextDependentRottenAsserts',
		'branchCalls',
		'loopCalls',
		'assertCallSitesGettingFalseLiteral',
		'rottenTests'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #visiting }
RTFTestCaseAnalysisResult >> acceptVisitor: aRTFAnalysisResultVisitor [
	^ aRTFAnalysisResultVisitor visitRTFTestCaseAnalysisResult: self
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> assertCallSitesGettingFalseLiteral [
	^ assertCallSitesGettingFalseLiteral
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> assertCallSitesGettingFalseLiteral: anObject [
	assertCallSitesGettingFalseLiteral := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> branchCalls [
	^ branchCalls
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> branchCalls: anObject [
	branchCalls := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> contextDependentRottenAsserts [
	^ contextDependentRottenAsserts
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> contextDependentRottenAsserts: anObject [
	contextDependentRottenAsserts := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> firstLevelHelperCalls [
	^ firstLevelHelperCalls
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> firstLevelHelperCalls: anObject [
	firstLevelHelperCalls := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> firstLevelPrimitivesCalls [
	^ firstLevelPrimitivesCalls
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> firstLevelPrimitivesCalls: anObject [
	firstLevelPrimitivesCalls := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> helperCalls [
	^ helperCalls
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> helperCalls: anObject [
	helperCalls := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> helperMaxDepth [
	^ maxDepth
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> helpers [
	^ helpers
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> helpers: anObject [
	helpers := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> isRotten [
	^ isRotten
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> isRotten: anObject [
	isRotten := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> loopCalls [
	^ loopCalls
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> loopCalls: anObject [
	loopCalls := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> maxDepth: anObject [
	maxDepth := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> primitivesCalls [
	^ primitivesCalls
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> primitivesCalls: anObject [
	primitivesCalls := anObject
]

{ #category : #printing }
RTFTestCaseAnalysisResult >> printOn: aStream [
	super printOn: aStream.
	aStream
		<< $(.
	self testCase printOn: aStream.
	aStream
		<< $).
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> rottenTests [
	^ rottenTests
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> rottenTests: anObject [
	rottenTests := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> testCase [
	^ testCase
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> testCase: anObject [
	testCase := anObject
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> testContainsReturn [
	^ testContainsReturn
]

{ #category : #accessing }
RTFTestCaseAnalysisResult >> testContainsReturn: anObject [
	testContainsReturn := anObject
]
