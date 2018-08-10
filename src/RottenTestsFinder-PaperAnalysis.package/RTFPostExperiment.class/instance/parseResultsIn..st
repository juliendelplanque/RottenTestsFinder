parsing
parseResultsIn: aDirectory
	^ (aDirectory childrenMatching: 'rotten-tests-*') collect: [ :csvFile |
		|expName expData|
		expName := csvFile basename copyFrom: 'rotten-tests-' size + 1 to: csvFile basename size - '.csv' size.
		expData := RTFExperimentData new
						name: expName;
						yourself.
		csvFile readStreamDo: [ :s |
			expData
				tests: ((NeoCSVReader on: s)
							skipHeader;
							addField;
							addField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addFieldConverter: [ :str | str = 'true' ];
							addIntegerField;
							addFieldConverter: [ :str | str = 'true' ];
							addIntegerField;
							upToEnd) ].
		(aDirectory / ('rotten-helpers-',expName,'.csv')) readStreamDo: [ :s |
			expData
				helpers: ((NeoCSVReader on: s)
							skipHeader;
							addField;
							addField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addIntegerField;
							addFieldConverter: [ :str | str = 'true' ];
							addIntegerField;
							addFieldConverter: [ :str | str = 'true' ];
							addIntegerField;
							upToEnd) ] ]