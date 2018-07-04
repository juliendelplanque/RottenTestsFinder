adding
addYourselfIn: aCollection
	"If the test implemented in a super class is already present in aCollection, add a subclass to it.
	 Else, add the result to aCollection."
	
	self assert: self subclassesInWhichTestIsRotten size = 1.
	
	aCollection
		detect: [ :rottenTest |
			rottenTest isImplementedInSuperClass and: [ rottenTest superClass = self superClass ] ]
		ifFound: [ :rottenTest | rottenTest addSubclassInWhichTestIsRotten: self subclassesInWhichTestIsRotten anyOne ]
		ifNone: [ aCollection add: self ]