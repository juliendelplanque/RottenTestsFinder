visiting
visitRTFSelfCallRootNode: aRTFSelfCallRootNode
	aRTFSelfCallRootNode subCalls do: [ :subCall | subCall acceptVisitor: self ]