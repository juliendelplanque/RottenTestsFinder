tests
test
	false
		ifTrue: [ self goodHelper ].
		
	self perform: ('as' , 'sert:') asSymbol with: true