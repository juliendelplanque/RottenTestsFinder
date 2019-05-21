Class {
	#name : #RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion >> test [
	false
		ifTrue: [ self assert: true ].
	
	self rottenHelper
]
