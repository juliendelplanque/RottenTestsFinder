Class {
	#name : #RTFBaselinePackagesCollector,
	#superclass : #Object,
	#instVars : [
		'packages'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #'reflective operations' }
RTFBaselinePackagesCollector >> doesNotUnderstand: aMessage [
	(aMessage sender isKindOf: BaselineOf)
		ifTrue: [ ^ self ].
	
	super doesNotUnderstand: aMessage
]

{ #category : #initialization }
RTFBaselinePackagesCollector >> initialize [
	super initialize.
	self packages: OrderedCollection new
]

{ #category : #accessing }
RTFBaselinePackagesCollector >> package: aString [
	self packages add: aString
]

{ #category : #accessing }
RTFBaselinePackagesCollector >> package: aString with: aBlock [
	self package: aString 
]

{ #category : #accessing }
RTFBaselinePackagesCollector >> packages [
	^ packages
]

{ #category : #accessing }
RTFBaselinePackagesCollector >> packages: anObject [
	packages := anObject
]
