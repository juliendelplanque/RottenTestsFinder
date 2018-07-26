experiment
runExperimentOnPackages: aListOfPackages andWriteResultsOn: aStream
	| visitor |
	visitor := RTFResultsToCSVExporter new
					neoCSV: (NeoCSVWriter on: aStream);
					addHeader;
					yourself.
	aListOfPackages do: [ :package |
		(RTFPackageAnalyzer analyze: package) acceptVisitor: visitor ]