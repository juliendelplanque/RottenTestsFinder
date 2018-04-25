initialization
initializeWidgets
	packagesListLabel := self newLabel.
	self updatePackagesListLabel.
	
	packagesList :=  self instantiate: FastTableModel.
	packagesList
		items: (RPackage organizer packages select: [ :p |
			p classes anySatisfy: [ :c | c allSuperclasses includes: TestCase ] ]);
		sortingBlock: [ :a :b | a name < b name ];
		displayBlock: [ :package | package name ];
		beMultipleSelection.
	
	classesListLabel := self newLabel.
	self updateClassesListLabel.
	
	classesList :=  self instantiate: FastTableModel.
	
	classesList
		sortingBlock: [ :a :b | a name < b name ];
		whenSelectionChanged: [ self updateClassesListLabel ];
		beMultipleSelection.
	
	packagesList whenSelectionChanged: [ 
		self whenPackagesSelectionChanged: self packagesSelected ].
			
	resultsListLabel := self newLabel.
	self updateResultsListLabel.
	
	resultsList := self instantiate: FastTableModel.
	
	resultsList
		displayBlock: [ :method |
			method printString ];
		doubleClickAction: [ 
			self browseSelectedTest ];
		sortingBlock: [ :a :b | a name < b name ].
	
	startButton := self newButton.
	
	startButton
		label: 'Start analysis' translated;
		action: [ self startAnalysis ].
	
	browseButton := self newButton.
	
	browseButton
		label: 'Browse test' translated;
		action: [ self browseSelectedTest ]