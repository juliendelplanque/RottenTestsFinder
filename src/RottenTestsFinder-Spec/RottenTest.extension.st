Extension { #name : #RottenTest }

{ #category : #'*RottenTestsFinder-Spec' }
RottenTest >> rtfBrowserBrowse [
	Smalltalk tools browser openOnClass: self compiledMethod methodClass selector: self compiledMethod selector
]

{ #category : #'*RottenTestsFinder-Spec' }
RottenTest >> rtfBrowserName [
	^ self compiledMethod printString
]

{ #category : #'*RottenTestsFinder-Spec' }
RottenTest >> rtfBuilderBuildContextMenu: menu [
	self rtfBuilderBuildSpecificContextMenu: menu.
	
	menu
		addLine;
		add: 'Copy name into clipboard'
		target: Clipboard default
		selector: #clipboardText:
		argument: self compiledMethod printString.
		
	menu
		add: 'See rotten call sites'
		target: [ 
			RTFCallSitesViewer new
				onCallSites: self callSites;
				extent: (World extent * 0.6);
				openWithSpec ]
		selector: #value
]

{ #category : #'*RottenTestsFinder-Spec' }
RottenTest >> rtfBuilderBuildSpecificContextMenu: menu [
	menu
		add: 'Browse test' target: self selector: #rtfBrowserBrowse
]
