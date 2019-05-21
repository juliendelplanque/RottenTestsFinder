Class {
	#name : #RTFRow13HelperExecutedAssertionExecutedContainsNoHelperContainsNoAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow13HelperExecutedAssertionExecutedContainsNoHelperContainsNoAssertion >> test [
	self perform: ('as' , 'sert:') asSymbol with: true.
	
	self perform: ('goodHelper' , 'Wrapper') asSymbol
]
