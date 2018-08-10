computed
testClassesDepth
	^ (self tests collect: [ :array |
		{ (array second splitOn: '>>') first . array at: 12 } ]) asSet asArray