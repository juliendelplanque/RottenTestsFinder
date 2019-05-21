Class {
	#name : #RTFHelperAndParentCollector,
	#superclass : #RTFSelfCallVisitor,
	#instVars : [
		'parentsStack',
		'parentHelperPairs'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #initialization }
RTFHelperAndParentCollector >> initialize [
	super initialize.
	self
		parentsStack: Stack new;
		parentHelperPairs: OrderedCollection new.
]

{ #category : #accessing }
RTFHelperAndParentCollector >> parentHelperPairs [
	^ parentHelperPairs
]

{ #category : #accessing }
RTFHelperAndParentCollector >> parentHelperPairs: anObject [
	parentHelperPairs := anObject
]

{ #category : #accessing }
RTFHelperAndParentCollector >> parentsStack [
	^ parentsStack
]

{ #category : #accessing }
RTFHelperAndParentCollector >> parentsStack: anObject [
	parentsStack := anObject
]

{ #category : #visiting }
RTFHelperAndParentCollector >> visitRTFSelfCallNode: aRTFSelfCallNode [
	"Do not collect assert primitives."
	(RottenTestsFinder assertionSelectors includes: aRTFSelfCallNode compiledMethod selector)
		ifTrue: [ ^ self ].
	
	"If root node, do not generate pair."
	self parentsStack
		ifNotEmpty: [ self parentHelperPairs add: self parentsStack top compiledMethod -> aRTFSelfCallNode compiledMethod ].
	
	"Push the new parent on stack and visit subnodes."
	self parentsStack push: aRTFSelfCallNode.
	aRTFSelfCallNode subCalls do: [ :subCall | subCall acceptVisitor: self ]
]
