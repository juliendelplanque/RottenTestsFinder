Class {
	#name : #RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion >> test [
	self
		assert: true.

	false
		ifTrue: [ self goodHelper ]
]
