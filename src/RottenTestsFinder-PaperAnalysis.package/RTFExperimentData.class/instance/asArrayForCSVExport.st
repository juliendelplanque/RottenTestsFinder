converting
asArrayForCSVExport
	^ { 
		self name.
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
		self rottenTestsCategory1Count.
		self rottenTestsCategory2Count.
		self rottenTestsCategory3Count.
		self rottenTestsCategory4Count
	 }