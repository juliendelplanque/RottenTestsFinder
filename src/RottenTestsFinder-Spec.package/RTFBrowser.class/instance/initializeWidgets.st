initialization
initializeWidgets
	packagesList :=  self instantiate: FastTableModel.
	packagesList
		items: (RPackage organizer packages select: [ :p |
			p classes anySatisfy: [ :c | c allSuperclasses includes: TestCase ] ]);
		sortingBlock: [ :a :b | a name < b name ];
		displayBlock: [ :package | package name ];
		beMultipleSelection.
		
	classesList :=  self instantiate: FastTableModel.
	
	classesList
		beMultipleSelection.
	
	packagesList
		whenSelectionChanged: [
				classesList resetSelection.
				classesList items: (self packagesSelected collect: [ :p | p classes select: [ :c | c allSuperclasses includes: TestCase ] ]) flattened ].
			
		
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