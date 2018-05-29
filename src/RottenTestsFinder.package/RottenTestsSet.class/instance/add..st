adding
add: aRottenTest
	aRottenTest isImplementedInTrait
		ifFalse: [ 
			rottenTests add: aRottenTest.
			^ self ].
	
	rottenTests
		detect: [ :rottenTest |
			rottenTest isImplementedInTrait and: [ rottenTest trait = aRottenTest trait ] ]
		ifFound: [ :rottenTest | rottenTest addClassInWhichTestIsRotten: aRottenTest compiledMethod methodClass ]
		ifNone: [ rottenTests add: (aRottenTest) ]