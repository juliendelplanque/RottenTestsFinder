visiting
visitRTFSelfCallRootNode: aRTFSelfCallRootNode
	^ ((aRTFSelfCallRootNode subCalls
			collect: [ :subCall | subCall acceptVisitor: self ]) ifEmpty: [ #(0) ]) max