"
My subclasses create the 16 context in which rotten tests can appear that we identified in the paper.
"
Class {
	#name : #RTFAbstractTestCaseForPaper,
	#superclass : #TestCase,
	#category : 'RottenTestsFinder-FakePaperTests'
}

{ #category : #helper }
RTFAbstractTestCaseForPaper >> goodHelper [
	self assert: true
]

{ #category : #helper }
RTFAbstractTestCaseForPaper >> goodHelperWrapper [
	self goodHelper
]

{ #category : #'doing nothing' }
RTFAbstractTestCaseForPaper >> methodDoingNothing [
	"Do nothing on purpose."
]

{ #category : #helper }
RTFAbstractTestCaseForPaper >> rottenHelper [
	false ifTrue: [ self assert: true ]
]
