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
						add: #resultsList ];
				newRow: #startButton height: self buttonHeight ];
		yourself