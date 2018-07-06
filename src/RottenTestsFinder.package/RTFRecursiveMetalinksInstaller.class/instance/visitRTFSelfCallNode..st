visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	self installMetaLinkOn: aRTFSelfCallNode.
	aRTFSelfCallNode subCalls do: [ :selfCallSubNode |
		selfCallSubNode acceptVisitor: self. ]