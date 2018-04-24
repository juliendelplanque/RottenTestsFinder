private-visiting
visitTestSuite: aTestSuite
	aTestSuite tests do: [ :test |
		test acceptRottenTestsFinder: self ]