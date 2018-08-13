visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	"Do not collect assert primitives."
	(RottenTestsFinder assertionSelectors includes: aRTFSelfCallNode compiledMethod selector)
		ifTrue: [ ^ self ].
	
	"If root node, do not generate pair."
	self parentsStack
		ifNotEmpty: [ self parentHelperPairs add: self parentsStack top compiledMethod -> aRTFSelfCallNode compiledMethod ].
	
	"Push the new parent on stack and visit subnodes."
	self parentsStack push: aRTFSelfCallNode.
	aRTFSelfCallNode subCalls do: [ :subCall | subCall acceptVisitor: self ]