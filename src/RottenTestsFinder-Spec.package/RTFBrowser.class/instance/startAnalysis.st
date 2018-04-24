actions
startAnalysis
	| suite |
	suite := TestSuite new.
	self classesSelected collect: #suite thenDo: [ :s |
		suite addTests: s tests ].
	
	self resultsList
		items: (RottenTestsFinder analyze: suite)