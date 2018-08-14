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
							upToEnd) ].
		(aDirectory / ('rotten-helper-calls-',expName,'.csv')) readStreamDo: [ :s |
			expData
				helperCalls: ((NeoCSVReader on: s)
							skipHeader;
							addField;
							addIntegerField;
							addField;
							upToEnd) ].
		(aDirectory / '..' / 'projects-meta.csv') readStreamDo: [ :s |
			expData
				projectData: (((NeoCSVReader on: s)
									separator: $;;
									skipHeader;
									addField;
									addField;
									addField;
									addField;
									addIntegerField;
									addIntegerField;
									addIntegerField;
									addField;
									upToEnd) detect: [ :array | array first = expName ]) ] ]