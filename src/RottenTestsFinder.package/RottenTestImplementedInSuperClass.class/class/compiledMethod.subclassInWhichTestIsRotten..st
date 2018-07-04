instance creation
compiledMethod: aCompiledMethod subclassInWhichTestIsRotten: aClass
	^ self compiledMethod: aCompiledMethod subclassesInWhichTestIsRotten: (Set with: aClass)