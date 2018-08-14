analysis
convertPostAnalysisToLatexTab: aFileReference indexes: aCollectionOfInteger
	| data |
	data := aFileReference readStreamDo: [ :s | (NeoCSVReader on: s) upToEnd ].
	
	^ String streamContents: [ :s |
		data do: [ :array |
			|selected index|
			index := 1.
			selected := array select: [ :e | index := index +1. aCollectionOfInteger includes: index - 1 ].
			selected
				do: [ :e | s << (e ifNil: [ '/' ]) ]
				separatedBy: [ s << ' & ' ]
			] separatedBy: [ 
				s
					<< '\\'; 
					<< Smalltalk os lineEnding ] ]