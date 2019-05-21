Class {
	#name : #RTFExperiment,
	#superclass : #Object,
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #experiment }
RTFExperiment class >> runExperimentNamed: projectName fromExperimentMeta: aFileReference andWriteResultsIn: aDirectory [
	| projectMeta regex installScript imageVersion |
	projectMeta := aFileReference readStreamDo: [ :s | 
		((NeoCSVReader on: s)
			separator: $;;
			skipHeader;
			upToEnd) detect: [ :array | array first = projectName ] ifNone: [ self error: 'Unknown project' ] ].
	self
		assert: (regex := projectMeta second) isNotNil
		description: 'A regex to select test packages should be defined.';
		assert: (imageVersion := projectMeta third) = Smalltalk version
		description: 'The version of the image in which this script is run should be compatible with project version.'.
	
	installScript := projectMeta fourth.
	
	"Install the project using the script."
	OpalCompiler new
		source: installScript;
		evaluate.
		
	self runWholeExperimentOnPackagesMatchingRegex: regex underName: projectName andWriteInDirectory: aDirectory.
	
	^ projectMeta
]

{ #category : #experiment }
RTFExperiment class >> runExperimentOnPackages: aListOfPackages andWriteResultsOn: aStream [
	| visitor |
	visitor := RTFResultsToCSVExporter new
					neoCSV: (NeoCSVWriter on: aStream);
					addHeader;
					yourself.
	aListOfPackages do: [ :package |
		(RTFPackageAnalyzer analyze: package) acceptVisitor: visitor ]
]

{ #category : #experiment }
RTFExperiment class >> runExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: aStream [
	^ self runExperimentOnPackages: (RPackage organizer packages select: [ :p | p name matchesRegex: aRegex ]) andWriteResultsOn: aStream
]

{ #category : #experiment }
RTFExperiment class >> runHelperCallsExperimentOnPackages: aListOfPackages andWriteResultsOn: aStream [
	| visitor |
	visitor := RTFHelperCallsToCSVExporter new
					neoCSV: (NeoCSVWriter on: aStream);
					addHeader;
					yourself.
	aListOfPackages do: [ :package |
		(RTFPackageAnalyzer analyze: package) acceptVisitor: visitor ]
]

{ #category : #experiment }
RTFExperiment class >> runHelperCallsExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: aStream [
	^ self runHelperCallsExperimentOnPackages: (RPackage organizer packages select: [ :p | p name matchesRegex: aRegex ]) andWriteResultsOn: aStream
]

{ #category : #experiment }
RTFExperiment class >> runHelperExperimentOnPackages: aListOfPackages andWriteResultsOn: aStream [
	| visitor |
	visitor := RTFHelperResultsToCSVExporter new
					neoCSV: (NeoCSVWriter on: aStream);
					addHeader;
					yourself.
	aListOfPackages do: [ :package |
		(RTFPackageAnalyzer analyze: package) acceptVisitor: visitor ]
]

{ #category : #experiment }
RTFExperiment class >> runHelperExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: aStream [
	^ self runHelperExperimentOnPackages: (RPackage organizer packages select: [ :p | p name matchesRegex: aRegex ]) andWriteResultsOn: aStream
]

{ #category : #experiment }
RTFExperiment class >> runWholeExperimentOnPackagesMatchingRegex: aRegex underName: expName andWriteInDirectory: aFileReference [
	(aFileReference / ('rotten-tests-{1}.csv' format: { expName }))
		writeStreamDo: [ :s |
			self runExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: s ].
		
	(aFileReference / ('rotten-helpers-{1}.csv' format: { expName }))
		writeStreamDo: [ :s |
			self runHelperExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: s ].
	
	(aFileReference / ('rotten-helper-calls-{1}.csv' format: { expName }))
		writeStreamDo: [ :s |
			self runHelperCallsExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: s ]
]
