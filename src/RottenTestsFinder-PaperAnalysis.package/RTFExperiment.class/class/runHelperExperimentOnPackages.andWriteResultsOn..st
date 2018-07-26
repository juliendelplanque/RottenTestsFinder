experiment
runHelperExperimentOnPackages: aListOfPackages andWriteResultsOn: aStream
	| visitor |
	visitor := RTFHelperResultsToCSVExporter new
					neoCSV: (NeoCSVWriter on: aStream);
					addHeader;
					yourself.
	aListOfPackages do: [ :package |
		(RTFPackageAnalyzer analyze: package) acceptVisitor: visitor ]