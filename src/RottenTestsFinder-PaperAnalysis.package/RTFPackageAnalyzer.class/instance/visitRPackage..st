visiting
visitRPackage: aRPackage
	"Redefine #privateVisitRPackage: in order to wrap the result in a custom object.
	"
	^ RTFRPackageAnalysisResult new
		package: aRPackage;
		testCaseClassesAnalysisResults: (self privateVisitRPackage: aRPackage);
		yourself