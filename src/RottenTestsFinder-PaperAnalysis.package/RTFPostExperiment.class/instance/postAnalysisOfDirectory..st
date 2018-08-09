analysis
postAnalysisOfDirectory: aDirectory
	| results |
	results := (self parseResultsIn: aDirectory) sort: [ :a :b | a name < b name ].
	(aDirectory / 'post-analysis.csv')
		ensureDelete;
		writeStreamDo: [ :s |
			(NeoCSVWriter on: s)
				nextPut: RTFExperimentData headerArrayForCSVExport;
				nextPutAll: (results collect: #asArrayForCSVExport) ]
		
	