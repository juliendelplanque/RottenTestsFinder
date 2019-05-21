Class {
	#name : #RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion >> test [
	false
		ifTrue: [ self goodHelper ].
		
	self perform: ('as' , 'sert:') asSymbol with: true
]
