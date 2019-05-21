Extension { #name : #RBMessageNode }

{ #category : #'*RottenTestsFinder-PaperAnalysis' }
RBMessageNode >> rtfContext [
	"Either returns the RBMessageNode to which was passed a BlockClosure containing this message send
	 or, if this message is not sent in a BlockClosure, returns the RBMethodNode."
	| node foundBlock |
	foundBlock := false.
	node := self.
	[
		(node parent isMethod)
			ifTrue: [ ^ node parent ].
		(node isMessage and: [ foundBlock ])
			ifTrue: [ ^ node ].
		node isBlock
			ifTrue: [ foundBlock := true ].
		node := node parent
	] doWhileFalse: [ node isMethod ]. "Should not happen but safer than writing an infinite loop."

	^ node
]
