Extension { #name : #RottenTestImplementedInTrait }

{ #category : #'*RottenTestsFinder-Spec' }
RottenTestImplementedInTrait >> rtfBrowserBrowse [
	Smalltalk tools browser openOnClass: self compiledMethod origin selector: self compiledMethod selector
]

{ #category : #'*RottenTestsFinder-Spec' }
RottenTestImplementedInTrait >> rtfBrowserName [
	^ String streamContents: [ :s |
		self compiledMethod origin printOn: s.
		s
			<< '>>#';
			<< self compiledMethod selector;
			<< $[.
		self traitUsersInWhichTestIsRotten size printOn: s.
		s << $] ]
]

{ #category : #'*RottenTestsFinder-Spec' }
RottenTestImplementedInTrait >> rtfBuilderBuildSpecificContextMenu: menu [
	menu
		add: 'Browse test in trait' target: self selector: #rtfBrowserBrowse;
		addLine.
	(self traitUsersInWhichTestIsRotten sorted: [ :a :b | a name < b name ]) do: [ :class |
		menu
			add: 'Browse in ' , class name
			target: Smalltalk tools browser
			selector: #openOnClass:selector:
			argument: { class . self compiledMethod selector } ]
]
