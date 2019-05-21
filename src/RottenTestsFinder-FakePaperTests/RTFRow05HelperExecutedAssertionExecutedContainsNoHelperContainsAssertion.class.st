Class {
	#name : #RTFRow05HelperExecutedAssertionExecutedContainsNoHelperContainsAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow05HelperExecutedAssertionExecutedContainsNoHelperContainsAssertion >> test [
	self assert: true.
	
	self perform: ('good','Helper') asSymbol
]
