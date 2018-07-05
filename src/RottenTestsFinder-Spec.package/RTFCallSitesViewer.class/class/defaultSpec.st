specs
defaultSpec
	<spec>
	^ SpecLayout composed
		newColumn: [ :mainCol | 
			mainCol
				newRow: [ :row |
					row
						newColumn: [ :callSitesColumn |
							callSitesColumn
								add: #callSitesList ];
						addSplitter;
						newColumn: [ :classesColumn |
							 classesColumn
								add: #sourceCodeTextModel ] ] ];
		yourself