Class {
	#name : #RTFExperiment2,
	#superclass : #Object,
	#instVars : [
		'projectGithubUrl',
		'projectBaseline',
		'result'
	],
	#category : #'RottenTestsFinder-Experiment2'
}

{ #category : #steps }
RTFExperiment2 >> doExperiment [
	result := RottenTestsFinder analyze: self loadedPackagesSet
]

{ #category : #accessing }
RTFExperiment2 >> iceRepository [
	^ IceRepository registry detect: [ :repository |
		repository workingCopy packages
			anySatisfy: [ :any | any name = self projectBaseline ] ].
]

{ #category : #steps }
RTFExperiment2 >> installProject [
	Metacello new
		baseline: self projectBaseline;
		repository: self projectGithubUrl;
		onConflictUseIncoming;
		load.
]

{ #category : #accessing }
RTFExperiment2 >> loadedPackages [
	^ self iceRepository loadedPackages collect: [ :p | p package asPackage ]
]

{ #category : #accessing }
RTFExperiment2 >> loadedPackagesSet [
	^ RPackageSet new
		packages: self loadedPackages;
		yourself
]

{ #category : #accessing }
RTFExperiment2 >> projectBaseline [
	^ projectBaseline
]

{ #category : #accessing }
RTFExperiment2 >> projectBaseline: anObject [
	projectBaseline := anObject
]

{ #category : #accessing }
RTFExperiment2 >> projectGithubUrl [
	^ projectGithubUrl
]

{ #category : #accessing }
RTFExperiment2 >> projectGithubUrl: anObject [
	projectGithubUrl := anObject
]

{ #category : #accessing }
RTFExperiment2 >> resultsAsJSONObject [
	self flag: #TODO.
	self shouldBeImplemented
]
