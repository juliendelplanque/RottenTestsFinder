*RottenTestsFinder-Spec
rtfBuilderBuildContextMenu: menu
	menu
		add: 'Browse test' target: self selector: #rtfBrowserBrowse;
		addLine.
	(self testHelperCompiledMethods sorted: [ :a :b | a printString < b printString ]) do: [ :method |
		menu
			add: 'Browse rotten helper ' , method printString
			target: Smalltalk tools browser
			selector: #openOnMethod:
			argument: method ]