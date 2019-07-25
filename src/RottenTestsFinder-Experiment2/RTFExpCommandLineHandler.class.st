Class {
	#name : #RTFExpCommandLineHandler,
	#superclass : #CommandLineHandler,
	#category : #'RottenTestsFinder-Experiment2'
}

{ #category : #accessing }
RTFExpCommandLineHandler class >> commandName [
	^ 'rtfexp'
]

{ #category : #activation }
RTFExpCommandLineHandler >> activate [
	| experiment |
	experiment := RTFExperiment2 new
		projectGithubUrl: self projectGithubUrl;
		projectBaseline: self projectBaseline;
		yourself.
	
	experiment
		installProject;
		doExperiment.
		
	self stdout nextPutAll: (STONJSON toStringPretty: experiment resultsAsJSONObject).
		
	self exitSuccess
]

{ #category : #accessing }
RTFExpCommandLineHandler >> positionalArgumentAt: anIndex [
	^ self positionalArguments at: anIndex
]

{ #category : #accessing }
RTFExpCommandLineHandler >> positionalArguments [
	^ self arguments reject: [ :arg |
		((arg beginsWith: '--') and: [ arg size > 2 ]) or: [ 
			(arg beginsWith: '-') and: [ arg size > 1 ] ] ]
]

{ #category : #accessing }
RTFExpCommandLineHandler >> projectBaseline [
	^ self positionalArgumentAt: 2
]

{ #category : #accessing }
RTFExpCommandLineHandler >> projectGithubUrl [
	^ self positionalArgumentAt: 1
]
