experiment
runHelperCallsExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: aStream
	^ self runHelperCallsExperimentOnPackages: (RPackage organizer packages select: [ :p | p name matchesRegex: aRegex ]) andWriteResultsOn: aStream