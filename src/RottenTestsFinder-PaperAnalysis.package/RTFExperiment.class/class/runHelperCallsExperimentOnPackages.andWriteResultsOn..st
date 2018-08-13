experiment
runHelperCallsExperimentOnPackages: aListOfPackages andWriteResultsOn: aStream
	| visitor |
	visitor := RTFHelperCallsToCSVExporter new
					neoCSV: (NeoCSVWriter on: aStream);
					addHeader;
					yourself.
	aListOfPackages do: [ :package |
		(RTFPackageAnalyzer analyze: package) acceptVisitor: visitor ]