initialization
initializeWidgets
	packagesListLabel := self newLabel.
	self updatePackagesListLabel.
	packagesListLabel help: 'Select the packages to analyze. Cmd+A or Ctrl+A to select all packages.'.
	
	packagesList :=  self instantiate: FastTableModel.
	packagesList
		items: (RPackage organizer packages select: [ :p |
			p classes anySatisfy: [ :c | c allSuperclasses includes: TestCase ] ]);
		sortingBlock: [ :a :b | a name < b name ];
		displayBlock: [ :package | package name ];
		beMultipleSelection.
	
	classesListLabel := self newLabel.
	self updateClassesListLabel.
	classesListLabel help: 'Select the classes to analyze. Cmd+A or Ctrl+A to select all classes.'.
	
	classesList :=  self instantiate: FastTableModel.
	
	classesList
		sortingBlock: [ :a :b | a name < b name ];
		whenSelectionChanged: [ self updateClassesListLabel ];
		beMultipleSelection.
	
	packagesList whenSelectionChanged: [ 
		self whenPackagesSelectionChanged: self packagesSelected ].
			
	resultsListLabel := self newLabel.
	self updateResultsListLabel.
	resultsListLabel help: 'The rotten tests found during latest analysis. Double click on a test to browse it in the class browser.'.
	
	resultsList := self instantiate: FastTableModel.
	
	resultsList
		displayBlock: [ :rottenTest |
			rottenTest rtfBrowserName ];
		doubleClickAction: [ 
			self browseSelectedTest ];
		sortingBlock: [ :a :b | a rtfBrowserName < b rtfBrowserName ];
		menu: [ :menu | self menuForSelectedResult: menu. menu ].
	
	startButton := self newButton.
	
	startButton
		label: 'Start analysis' translated;
		help: 'Run the analysis to find rotten tests.';
		action: [ self startAnalysis ].
	
	browseButton := self newButton.
	
	browseButton
		label: 'Browse test' translated;
		help: 'Browse the rotten test selected in the results list.';
		action: [ self browseSelectedTest ].
		
	self initializeToolbar