initialization
initializeWidgets
	packagesListLabel := self newLabel
									label: 'Packages:';
									yourself.
	packagesList :=  self instantiate: FastTableModel.
	packagesList
		items: (RPackage organizer packages select: [ :p |
			p classes anySatisfy: [ :c | c allSuperclasses includes: TestCase ] ]);
		sortingBlock: [ :a :b | a name < b name ];
		displayBlock: [ :package | package name ];
		beMultipleSelection.
	
	classesListLabel := self newLabel
									label: 'Test cases:';
									yourself.
	classesList :=  self instantiate: FastTableModel.
	
	classesList
		sortingBlock: [ :a :b | a name < b name ];
		beMultipleSelection.
	
	packagesList whenSelectionChanged: [ 
		self whenPackagesSelectionChanged: self packagesSelected ].
			
	resultsListLabel := self newLabel
									label: 'Rotten tests:';
									yourself.
	resultsList := self instantiate: FastTableModel.
	
	resultsList
		displayBlock: [ :method |
			method printString ];
		doubleClickAction: [ 
			self browseSelectedTest ].
	
	startButton := self newButton.
	
	startButton
		label: 'Start analysis' translated;
		action: [ self startAnalysis ].
	
	browseButton := self newButton.
	
	browseButton
		label: 'Browse test' translated;
		action: [ self browseSelectedTest ]