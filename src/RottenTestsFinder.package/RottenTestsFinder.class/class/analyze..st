analyzing
analyze: aVisitableObject
	^ self new
		visitableObject: aVisitableObject;
		analyze;
		rottenTests