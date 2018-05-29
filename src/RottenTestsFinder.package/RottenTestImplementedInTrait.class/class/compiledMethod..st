instance creation
compiledMethod: aCompiledMethod
	^ (super compiledMethod: aCompiledMethod)
			traitUsersInWhichTestIsRotten: (Set with: aCompiledMethod methodClass);
			yourself