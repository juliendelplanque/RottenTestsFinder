instance creation
compiledMethod: aCompiledMethod subclassesInWhichTestIsRotten: aCollectionOfClasses
	^ (self compiledMethod: aCompiledMethod)
		subclassesInWhichTestIsRotten: aCollectionOfClasses;
		yourself