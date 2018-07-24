visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	(RottenTestsFinder assertionSelectors includes: aRTFSelfCallNode compiledMethod selector)
		ifFalse: [ self helperCalls add: aRTFSelfCallNode compiledMethod ].
	aRTFSelfCallNode subCalls do: [ :subCall | subCall acceptVisitor: self ]