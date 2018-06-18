visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	self halt.
	(aRTFSelfCallNode subCalls isEmpty and: [ RottenTestsFinder assertionCompiledMethods includes: aRTFSelfCallNode compiledMethod ])
		ifTrue: [ ^ true ].
		
	^ aRTFSelfCallNode subCalls anySatisfy: [ :subCallNode |
		self visitRTFSelfCallNode: subCallNode ]