*RottenTestsFinder
testHelperMethods
	^ self methods select: [ :m |
		(m selector beginsWith: 'test') not and: [ m isStaticallyCallingOneOfTheAssertMethods ] ]