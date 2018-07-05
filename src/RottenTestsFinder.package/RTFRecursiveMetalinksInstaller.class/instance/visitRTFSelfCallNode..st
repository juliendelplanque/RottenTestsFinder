visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	aRTFSelfCallNode subCalls do: [ :selfCallSubNode |
		self installMetaLinkOn: selfCallSubNode.
		selfCallSubNode subCalls do: [ :selfCallSubSubNode |
			selfCallSubSubNode acceptVisitor: self ] ]