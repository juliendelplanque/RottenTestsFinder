Class {
	#name : #RTFRow15HelperExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion,
	#superclass : #RTFAbstractTestCaseForPaper,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #tests }
RTFRow15HelperExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion >> test [
	self perform: ('goodHelper' , 'Wrapper') asSymbol
]

{ #category : #tests }
RTFRow15HelperExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion >> test2 [
	self perform: ('good','Helper') asSymbol
]
