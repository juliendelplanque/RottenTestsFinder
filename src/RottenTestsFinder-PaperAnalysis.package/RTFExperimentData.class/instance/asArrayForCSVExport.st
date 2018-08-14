converting
asArrayForCSVExport
	^ { 
		self name.
		self projectDescription.
		self packagesCount.
		self classesCount.
		self testClassesCount.
		self minimumOfClassDepth.
		self medianOfClassDepth.
		self maximumOfClassDepth.
		self testsCount.
		self helpersCount.
		self minimumOfMaxHelperDepths.
		self medianOfMaxHelperDepths.
		self maximumOfMaxHelperDepths.
		self minimumOfPrimitiveCallsInTestCounts.
		self medianOfPrimitiveCallsInTestCounts.
		self maximumOfPrimitiveCallsInTestCounts.
		self minimumOfHelperCallsInTestCounts.
		self medianOfHelperCallsInTestCounts.
		self maximumOfHelperCallsInTestCounts.
		self minimumOfHelperCallDefinitionDelta.
		self medianOfHelperCallDefinitionDelta.
		self maximumOfHelperCallDefinitionDelta.
		self rottenTestsCategory1Count.
		self rottenTestsCategory2Count.
		self rottenTestsCategory3Count.
		self rottenTestsCategory4Count
	 }