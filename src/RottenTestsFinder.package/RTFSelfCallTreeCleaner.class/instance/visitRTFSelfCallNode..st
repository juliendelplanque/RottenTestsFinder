visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	^ aRTFSelfCallNode
		subCalls: (aRTFSelfCallNode subCalls
						select: [ :subCallNode | subCallNode canLeadToAssertPrimitive ]
						thenCollect: [ :subCallNode | subCallNode acceptVisitor: self ]);
		yourself