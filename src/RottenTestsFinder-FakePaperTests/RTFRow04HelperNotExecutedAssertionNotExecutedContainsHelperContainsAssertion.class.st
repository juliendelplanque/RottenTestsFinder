Class {
	#name : #RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion >> test [
	false
		ifTrue: [ 
			self assert: true.
			self goodHelper ].
]
