specs
defaultSpec
	<spec>
	^ SpecLayout composed
		newColumn: [ :mainCol | 
			mainCol
				newRow: #toolbar height: self toolbarHeight;
				newRow: [ :row |
					row
						newColumn: [ :packagesColumn |
							packagesColumn
								add: #packagesListLabel height: self labelHeight;
								add: #packagesList ];
						addSplitter;
						newColumn: [ :classesColumn |
							 classesColumn
								add: #classesListLabel height: self labelHeight;
								add: #classesList ];
						addSplitter;
						newColumn: [ :resultsColumn |
							resultsColumn
								add: #resultsListLabel height: self labelHeight;
								add: #resultsList;
								add: #browseButton height: self buttonHeight ] ];
				newRow: #startButton height: self buttonHeight ];
		yourself