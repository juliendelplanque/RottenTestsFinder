visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	aRTFSelfCallNode subCalls do: [ :selfCallSubNode |
		selfCallSubNode metaLink uninstall.
		selfCallSubNode metaLink: nil.
		selfCallSubNode subCalls do: [ :selfCallSubSubNode |
			selfCallSubSubNode acceptVisitor: self ] ]