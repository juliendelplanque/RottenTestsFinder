testing
analyze: aVisitableObject
	| visitor |
	visitor := self new.
	^ aVisitableObject acceptSUnitVisitor: visitor