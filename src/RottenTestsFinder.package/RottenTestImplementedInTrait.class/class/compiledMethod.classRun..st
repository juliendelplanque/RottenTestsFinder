instance creation
compiledMethod: aCompiledMethod classRun: aClass
	^ (super compiledMethod: aCompiledMethod classRun: aClass)
			traitUsersInWhichTestIsRotten: (Set with: aCompiledMethod origin);
			yourself