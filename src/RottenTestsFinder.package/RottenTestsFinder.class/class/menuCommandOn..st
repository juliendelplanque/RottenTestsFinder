world menu
menuCommandOn: aBuilder 
	<worldMenu> 
	(aBuilder item: #'Rotten Tests Finder')
		parent: #Tools;
		order: 0.47;
		action:[self openBrowser]; 
		icon: (Smalltalk ui iconNamed: #smallFind).
	aBuilder withSeparatorAfter.