private
runTests
	rottenTests := RottenTestsSet new.
	self visitableObject
		acceptRottenTestsFinder: self