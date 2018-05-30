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
				self resultsList
					items: (RottenTestsFinder analyze: suite) rottenTests;
					resetSelection.
			] on: RTFTestAnalysed do: [ :notif |
				bar label: ('Analyzing test: {1}' format: { notif compiledMethod printString }).
				notif resume ] ]. 
		
		self updateResultsListLabel.
		self updateStatus: ('Analysis finished ({1}).' format: { self dateAndTimeString }).
	] ensure: [ self unlock ]