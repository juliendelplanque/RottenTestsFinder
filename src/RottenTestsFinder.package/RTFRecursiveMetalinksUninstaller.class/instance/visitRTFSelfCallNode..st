visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	self uninstallMetaLinkOf: aRTFSelfCallNode.
	aRTFSelfCallNode subCalls do: [ :selfCallSubNode |
		selfCallSubNode acceptVisitor: self ]