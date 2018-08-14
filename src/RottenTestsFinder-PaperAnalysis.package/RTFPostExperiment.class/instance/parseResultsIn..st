parsing
parseResultsIn: aDirectory
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