tests-visiting
testVisitRTFSelfCallNode
	self
		assert: (RTFLeadsToAssertPrimitiveCallChecker new visitRTFSelfCallNode: tree1);
		deny: (RTFLeadsToAssertPrimitiveCallChecker new visitRTFSelfCallNode: tree2)