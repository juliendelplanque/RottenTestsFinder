visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	(RottenTestsFinder assertionSelectors includes: aRTFSelfCallNode compiledMethod selector)
		ifTrue: [ self primitiveCalls add: aRTFSelfCallNode compiledMethod ].
	aRTFSelfCallNode subCalls do: [ :subCall | subCall acceptVisitor: self ]