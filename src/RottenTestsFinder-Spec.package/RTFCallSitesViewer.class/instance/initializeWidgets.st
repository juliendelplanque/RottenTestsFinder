initialization
initializeWidgets
	
	sourceCodeTextModel := self newText.
	
	sourceCodeTextModel
		beForCode;
		enabled: false.
		
	callSitesList := self newList.
	callSitesList
		whenSelectedItemChanged: [ :callSite |
			callSite ifNotNil: [ 
				self updateSourceCodeTextModelFor: callSite ] ]