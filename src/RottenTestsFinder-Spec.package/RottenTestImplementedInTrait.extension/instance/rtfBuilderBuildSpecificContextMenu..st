*RottenTestsFinder-Spec
rtfBuilderBuildSpecificContextMenu: menu
	menu
		add: 'Browse test in trait' target: self selector: #rtfBrowserBrowse;
		addLine.
	(self traitUsersInWhichTestIsRotten sorted: [ :a :b | a name < b name ]) do: [ :class |
		menu
			add: 'Browse in ' , class name
			target: Smalltalk tools browser
			selector: #openOnClass:selector:
			argument: { class . self compiledMethod selector } ]