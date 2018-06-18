visiting
visitMessageNode: aRBMessageNode
	| selfSentMethod callNode |
	aRBMessageNode receiver acceptVisitor: self.
	aRBMessageNode arguments do: [ :each | each acceptVisitor: self ].
	
	(aRBMessageNode receiver isSelf or: [ aRBMessageNode receiver isSuper ])
		ifFalse: [ ^ self ].
	
	selfSentMethod := (aRBMessageNode receiver isSuper
		ifTrue: [ selfClass superclass ]
		ifFalse: [ selfClass ]) lookupSelector: aRBMessageNode selector.
	
	callNode := RTFSelfCallNode compiledMethod: selfSentMethod.
	callStack top addCall: callNode.
	
	(considerClassesThat value: selfSentMethod methodClass)
		ifFalse: [ ^ self ].
	selfSentMethod isPrimitive
		ifTrue: [ ^ self ].
	(selfSentMethods includes: selfSentMethod)
		ifTrue: [ ^ self ].
	
	selfSentMethods add: selfSentMethod.
	
	
	callStack push: callNode.
	selfSentMethod ast acceptVisitor: self.
	callStack pop