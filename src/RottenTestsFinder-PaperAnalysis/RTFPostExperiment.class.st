"
I analyze CSV files generated during the experiment and post-process them to extract more data.
"
Class {
	#name : #RTFPostExperiment,
	#superclass : #Object,
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #analysis }
RTFPostExperiment class >> convertPostAnalysisToLatexTab: aFileReference indexes: aCollectionOfInteger [
	| data |
	data := aFileReference readStreamDo: [ :s | (NeoCSVReader on: s) upToEnd ].
	
	^ String streamContents: [ :s |
		data do: [ :array |
			|selected index|
			index := 1.
			selected := array select: [ :e | index := index +1. aCollectionOfInteger includes: index - 1 ].
			selected
				do: [ :e | s << (e ifNil: [ '/' ]) ]
				separatedBy: [ s << ' & ' ]
			] separatedBy: [ 
				s
					<< '\\'; 
					<< Smalltalk os lineEnding ] ]
]

{ #category : #analysis }
RTFPostExperiment class >> postAnalysisOfDirectory: aDirectory [
	^ self new postAnalysisOfDirectory: aDirectory
]

{ #category : #parsing }
RTFPostExperiment >> parseResultsIn: aDirectory [
	^ (aDirectory childrenMatching: 'rotten-tests-*') collect: [ :csvFile |
		|expName expData|
		expName := csvFile basename copyFrom: 'rotten-tests-' size + 1 to: csvFile basename size - '.csv' size.
		expData := RTFExperimentData new
						name: expName;
						yourself.
		expData
			parseTestsDataIn: csvFile;
			parseHelpersDataIn: (aDirectory / ('rotten-helpers-',expName,'.csv'));
			parseHelperCallsDataIn: (aDirectory / ('rotten-helper-calls-',expName,'.csv'));
			parseProjectIn: (aDirectory / '..' / 'projects-meta.csv') ]
]

{ #category : #analysis }
RTFPostExperiment >> postAnalysisOfDirectory: aDirectory [
	| results |
	results := (self parseResultsIn: aDirectory) sort: [ :a :b | a name < b name ].
	(aDirectory / 'post-analysis.csv')
		ensureDelete;
		writeStreamDo: [ :s |
			(NeoCSVWriter on: s)
				nextPut: RTFExperimentData headerArrayForCSVExport;
				nextPutAll: (results collect: #asArrayForCSVExport) ]
		
	
]
