parsing
parseResultsIn: aDirectory
	^ (aDirectory childrenMatching: 'rotten-tests-*') collect: [ :csvFile |
		csvFile readStreamDo: [ :s |
			RTFExperimentData new
				name: (csvFile basename copyFrom: 'rotten-tests-' size + 1 to: csvFile basename size - '.csv' size);
				data: ((NeoCSVReader on: s)
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
							upToEnd) ] ]