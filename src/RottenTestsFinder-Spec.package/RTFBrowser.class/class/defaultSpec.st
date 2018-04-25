specs
defaultSpec
	<spec>
	^ SpecLayout composed
		newColumn: [ :mainCol | 
			mainCol
				newRow: [ :row |
					row
						add: #packagesList;
						add: #classesList;
						newColumn: [ :resultsColumn |
							resultsColumn
								add: #resultsList;
								add: #browseButton height: self buttonHeight ] ];
				newRow: #startButton height: self buttonHeight ];
		yourself