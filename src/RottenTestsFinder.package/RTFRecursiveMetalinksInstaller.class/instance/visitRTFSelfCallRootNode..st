visiting
visitRTFSelfCallRootNode: aRTFSelfCallRootNode
	aRTFSelfCallRootNode subCalls do: [ :subSelfCall |
		subSelfCall acceptVisitor: self ]