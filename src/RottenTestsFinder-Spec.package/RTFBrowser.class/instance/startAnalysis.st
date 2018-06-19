actions
startAnalysis
	| suite |
	[
		self lock.
		self updateStatus: ('Analysis started ({1}).' format: { self dateAndTimeString }).
		suite := TestSuite new.
		self classesSelected collect: #suite thenDo: [ :s |
			suite addTests: s tests ].
	
		UIManager default informUserDuring: [ :bar |
			[
				[	
					|results|
					results := RottenTestsFinder analyze: suite.
					self resultsList
						items: results rottenTests;
						resetSelection.
					results inspect.
				] on: Warning do: [ :warning |
					Transcript
						show: warning messageText;
						cr.
					warning resume ]
			] on: RTFTestAnalysed do: [ :notif |
				bar label: ('Analyzing test: {1}' format: { notif compiledMethod printString }).
				notif resume ] ]. 
		
		self updateResultsListLabel.
		self updateStatus: ('Analysis finished ({1}).' format: { self dateAndTimeString }).
	] ensure: [ self unlock ]