experiment
runWholeExperimentOnPackagesMatchingRegex: aRegex underName: expName andWriteInDirectory: aFileReference
	(aFileReference / ('rotten-tests-{1}.csv' format: { expName }))
		writeStreamDo: [ :s |
			self runExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: s ].
		
	(aFileReference / ('rotten-helpers-{1}.csv' format: { expName }))
		writeStreamDo: [ :s |
			self runHelperExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: s ].
	
	(aFileReference / ('rotten-helper-calls-{1}.csv' format: { expName }))
		writeStreamDo: [ :s |
			self runHelperCallsExperimentOnPackagesMatchingRegex: aRegex andWriteResultsOn: s ]