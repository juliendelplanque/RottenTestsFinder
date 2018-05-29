private
menuForSelectedResult: menu
	self resultSelected ifNil: [ ^ self ].
	
	self resultSelected
		rtfBuilderBuildContextMenu: menu