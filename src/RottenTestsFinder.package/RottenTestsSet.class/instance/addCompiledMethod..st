adding
addCompiledMethod: aCompiledMethod
	aCompiledMethod origin isTrait
		ifFalse: [ self add: (RottenTest compiledMethod: aCompiledMethod) ]
		ifTrue: [ self add: (RottenTestImplementedInTrait compiledMethod: (aCompiledMethod origin >> aCompiledMethod selector )) ].