tests-visiting
testVisitRTFSelfCallNode
	| visitor methods |
	visitor := RTFMethodCallsCollector new.
	methods := tree acceptVisitor: visitor.
	
	self
		assertCollection: visitor compiledMethods
		hasSameElements: { 'Fake CM' . 'Fake CM 2' . 'Fake CM 3' . TestAsserter >> #assert: . 'Fake CM 4' . 'Fake CM 5' }