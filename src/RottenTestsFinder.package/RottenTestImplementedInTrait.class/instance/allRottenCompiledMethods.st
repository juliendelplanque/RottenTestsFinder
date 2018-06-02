accessing
allRottenCompiledMethods
	^ self traitUsersInWhichTestIsRotten collect: [ :class |
		class >> self compiledMethod selector ]