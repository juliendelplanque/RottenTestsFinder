visiting
visitRTFSelfCallNode: aRTFSelfCallNode
	aRTFSelfCallNode isCallToAssertPrimitive
		ifTrue: [ ^ 0 ].
	^ (self visitRTFSelfCallRootNode: aRTFSelfCallNode) + 1