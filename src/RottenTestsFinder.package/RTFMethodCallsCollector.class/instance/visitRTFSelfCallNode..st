visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	self compiledMethods add: aRTFSelfCallNode compiledMethod.
	aRTFSelfCallNode subCalls do: [ :subCall | subCall acceptVisitor: self ]