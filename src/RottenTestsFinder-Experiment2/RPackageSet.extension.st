Extension { #name : #RPackageSet }

{ #category : #'*RottenTestsFinder-Experiment2' }
RPackageSet >> acceptSUnitVisitor: aTSUnitVisitor [
	^ aTSUnitVisitor visitRPackageSet: self
]
