private
runTests
	rottenTests := OrderedCollection new.
	self visitableObject
		acceptRottenTestsFinder: self