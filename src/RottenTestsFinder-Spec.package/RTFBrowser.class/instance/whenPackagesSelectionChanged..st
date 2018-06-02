private
whenPackagesSelectionChanged: packagesSelected
	classesList resetSelection.
	classesList items: (packagesSelected collect: [ :p | 
		p definedClasses select: [ :c | c allSuperclasses includes: TestCase ] ]) flattened.
	self updatePackagesListLabel