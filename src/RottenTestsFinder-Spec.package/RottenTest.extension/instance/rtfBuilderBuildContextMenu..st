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
		add: 'Inspect'
		target: self
		selector: #inspect