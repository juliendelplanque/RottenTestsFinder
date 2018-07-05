visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	
	aRTFSelfCallNode subCalls do: [ :selfCallSubNode |
		self installMetaLinkOn: selfCallSubNode ]