Class {
	#name : #RottenTestsFinderTestForPaper,
	#superclass : #TestCase,
	#category : 'RottenTestsFinder-PaperTests'
}

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow01 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow01HelperExecutedAssertionExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow02 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow02HelperNotExecutedAssertionExecutedContainsHelperContainsAssertion
				and: [ m selector = #test ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow03 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 2;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow03HelperExecutedAssertionNotExecutedContainsHelperContainsAssertion
				and: [ m selector = #test ] ]);
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFAbstractTestCaseForPaper
				and: [ m selector = #rottenHelper ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow04 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion
				and: [ m selector = #test ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow05 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow05HelperExecutedAssertionExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow06 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow06HelperNotExecutedAssertionExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow07 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow07HelperExecutedAssertionNotExecutedContainsNoHelperContainsAssertion
				and: [ m selector = #test ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow08 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow08HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow08HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsAssertion
				and: [ m selector = #test ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow09 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow09HelperExecutedAssertionExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow10 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow10HelperNotExecutedAssertionExecutedContainsHelperContainsNoAssertion
				and: [ m selector = #test ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow11 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow11HelperExecutedAssertionNotExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFAbstractTestCaseForPaper
				and: [ m selector = #rottenHelper ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow12 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow12HelperNotExecutedAssertionNotExecutedContainsHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests size equals: 1;
		assert: (rottenTestsFound rottenCompiledMethods anySatisfy: [ :m | 
			m methodClass = RTFRow12HelperNotExecutedAssertionNotExecutedContainsHelperContainsNoAssertion
				and: [ m selector = #test ] ])
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow13 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow13HelperExecutedAssertionExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow14 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow14HelperNotExecutedAssertionExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow15 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow15HelperExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]

{ #category : #tests }
RottenTestsFinderTestForPaper >> testRow16 [
	| rottenTestsFound |
	rottenTestsFound := RottenTestsFinder analyze: RTFRow16HelperNotExecutedAssertionNotExecutedContainsNoHelperContainsNoAssertion suite.
	
	self
		assert: rottenTestsFound rottenTests isEmpty
]
