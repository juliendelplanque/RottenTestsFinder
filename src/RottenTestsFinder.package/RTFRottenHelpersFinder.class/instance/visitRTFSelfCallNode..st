visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	(aRTFSelfCallNode subCalls allSatisfy: #hasBeenExecuted)
		ifTrue: [ 
			aRTFSelfCallNode subCalls do: [ :selfSubCall |
		 		selfSubCall acceptVisitor: self ].
			^ self ].
		
	self rottenHelpers add: ((RottenTestHelper compiledMethod: aRTFSelfCallNode compiledMethod)
										callSites: (aRTFSelfCallNode subCalls reject: #hasBeenExecuted thenCollect: #astNode);
										yourself).
	aRTFSelfCallNode subCalls
		select: #hasBeenExecuted
		thenDo: [ :selfSubCall | selfSubCall acceptVisitor: self ].