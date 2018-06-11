visiting
visitMessageNode: aRBMessageNode
	| selfSentMethod |
	aRBMessageNode receiver acceptVisitor: self.
	aRBMessageNode arguments do: [ :each | each acceptVisitor: self ].
	
	(aRBMessageNode receiver isSelf or: [ aRBMessageNode receiver isSuper ])
		ifFalse: [ ^ self ].
	
	selfSentMethod := (aRBMessageNode receiver isSuper
		ifTrue: [ selfClass superclass ]
		ifFalse: [ selfClass ]) lookupSelector: aRBMessageNode selector.
	(considerClassesThat value: selfSentMethod methodClass)
		ifFalse: [ ^ self ].
	selfSentMethod isPrimitive
		ifTrue: [ ^ self ].
	(selfSentMethods includes: selfSentMethod)
		ifTrue: [ ^ self ].
	
	selfSentMethods add: selfSentMethod.
	selfSentMethod ast acceptVisitor: self