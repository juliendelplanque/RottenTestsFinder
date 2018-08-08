experiment
runExperimentNamed: projectName fromExperimentMeta: aFileReference andWriteResultsIn: aDirectory
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