initialization
initializeWidgets
	packagesList := self newList.
	packagesList
		items: (RPackage organizer packages select: [ :p |
			p classes anySatisfy: [ :c | c allSuperclasses includes: TestCase ] ]);
		sortingBlock: [ :a :b | a name < b name ];
		displayBlock: [ :package | package name ];
		beMultipleSelection.
		
	classesList := self newList.
	
	classesList
		beMultipleSelection.
	
	packagesList
		whenSelectionChanged: [
				classesList resetSelection.
				classesList items: (self packagesSelected collect: [ :p | p classes select: [ :c | c allSuperclasses includes: TestCase ] ]) flattened ].
			
		
	resultsList := self newList.
	
	resultsList
		displayBlock: [ :method |
			method printString ].
	
	startButton := self newButton.
	
	startButton
		label: 'Start analysis' translated;
		action: [ self startAnalysis ]