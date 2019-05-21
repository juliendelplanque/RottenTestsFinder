Class {
	#name : #RTFRow09HelperExecutedAssertionExecutedContainsHelperContainsNoAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow09HelperExecutedAssertionExecutedContainsHelperContainsNoAssertion >> test [
	self perform: ('as' , 'sert:') asSymbol with: true.
	
	self goodHelper.
]
