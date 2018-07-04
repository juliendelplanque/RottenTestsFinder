adding
addYourselfIn: aCollection
	"If the test implemented in a trait is already present in aCollection, add a trait user to it.
	 Else, add the result to aCollection."
	aCollection
		detect: [ :rottenTest |
			rottenTest isImplementedInTrait and: [ rottenTest trait = self trait ] ]
		ifFound: [ :rottenTest | rottenTest addClassInWhichTestIsRotten: self compiledMethod methodClass ]
		ifNone: [ aCollection add: self ]