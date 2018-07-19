*RottenTestsFinder-Spec
rtfBuilderBuildContextMenu: menu
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