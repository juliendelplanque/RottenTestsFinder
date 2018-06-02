private
runTests
	rottenTests := RottenTestsSet new.
	self visitableObject
		acceptSUnitVisitor: self