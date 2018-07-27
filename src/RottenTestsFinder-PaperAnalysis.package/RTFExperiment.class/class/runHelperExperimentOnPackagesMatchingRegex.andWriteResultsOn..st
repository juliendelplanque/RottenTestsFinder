experiment
runHelperExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: aStream
	^ self runHelperExperimentOnPackages: (RPackage organizer packages select: [ :p | p name matchesRegex: aRegex ]) andWriteResultsOn: aStream