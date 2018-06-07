*RottenTestsFinder
testHelperMethods
	^ (self allSuperclassesIncluding: TestCase) allButLast flatCollect: [ :class |
		class methods select: [ :m |
			(m selector beginsWith: 'test') not and: [ m isStaticallyCallingOneOfTheAssertMethods ] ] ]