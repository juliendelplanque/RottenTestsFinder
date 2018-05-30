comparing
= anObject
	^ self class = anObject class
		and: [ self compiledMethod = anObject compiledMethod ]