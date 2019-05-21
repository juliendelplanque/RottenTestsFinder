Class {
	#name : #RTFRow14HelperNotExecutedAssertionExecutedContainsNoHelperContainsNoAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow14HelperNotExecutedAssertionExecutedContainsNoHelperContainsNoAssertion >> test [
	self perform: ('as' , 'sert:') asSymbol with: true
]
