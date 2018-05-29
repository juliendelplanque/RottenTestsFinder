adding
addCompiledMethod: aCompiledMethod
	aCompiledMethod origin isClass
		ifTrue: [ self add: (RottenTest compiledMethod: aCompiledMethod) ]
		ifFalse: [ self add: (RottenTestImplementedInTrait compiledMethod: aCompiledMethod) ].