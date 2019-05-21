Class {
	#name : #RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion >> test [
	false
		ifTrue: [ self assert: true ].
		
	self perform: ('rotten','Helper') asSymbol
]
