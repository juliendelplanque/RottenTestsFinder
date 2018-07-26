testing
isCompiledMethodRotten: aCompiledMethod
	^ self rottenTests anySatisfy: [ :rottenTest |
		rottenTest compiledMethod = aCompiledMethod ]