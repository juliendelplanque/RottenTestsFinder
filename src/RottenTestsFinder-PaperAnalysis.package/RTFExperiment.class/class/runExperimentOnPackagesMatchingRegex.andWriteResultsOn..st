experiment
runExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: aStream
	^ self runExperimentOnPackages: (RPackage organizer packages select: [ :p | p name matchesRegex: aRegex ]) andWriteResultsOn: aStream