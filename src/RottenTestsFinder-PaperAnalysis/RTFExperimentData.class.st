"
I am data extracted from a CSV file generated during the experiment.
"
Class {
	#name : #RTFExperimentData,
	#superclass : #Object,
	#instVars : [
		'name',
		'tests',
		'helpers',
		'helperCalls',
		'projectData'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #accessing }
RTFExperimentData class >> headerArrayForCSVExport [
	^ #(
	'Project'
	'Description'
	'Number of packages'
	'Number of classes'
	'Number of test classes'
	'Minimum class depth'
	'Median class depth'
	'Maximum class depth'
	'Number of tests'
	'Number of helpers'
	'Minimum max helper depth'
	'Median max helper depth'
	'Maximum max helper depth'
	'Minimum primitive calls in test count'
	'Median primitive calls in test count'
	'Maximum primitive calls in test count'
	'Minimum helper calls in test count'
	'Median helper calls in test count'
	'Maximum helper calls in test count'
	'Minimum helper call/definition delta'
	'Median helper call/definition delta'
	'Maximum helper call/definition delta'
	'Insidious cat. 1'
	'Insidious cat. 2'
	'Insidious cat. 3'
	'Insidious cat. 4'
	)
]

{ #category : #computed }
RTFExperimentData >> allRottenTests [
	^ self tests select: [ :array | array at: 11 ]
]

{ #category : #converting }
RTFExperimentData >> asArrayForCSVExport [
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
]

{ #category : #'computed-metrics' }
RTFExperimentData >> classesCount [
	^ self projectData at: 6
]

{ #category : #computed }
RTFExperimentData >> helperCallDefinitionDelta [
	"Return the list of call/definition deltas.
	 This is an integer representing the number of class separating the class calling the method and the class where the helper is defined.
	 For example, if this number is 0, the helper is defined in the same class as the caller.
	 If the number is 2, the helper is defined 2 classes above in the inheritance hierarchy."
	^ self helperCalls collect: [ :array | array second abs ]
]

{ #category : #accessing }
RTFExperimentData >> helperCalls [
	^ helperCalls
]

{ #category : #accessing }
RTFExperimentData >> helperCalls: anObject [
	helperCalls := anObject
]

{ #category : #computed }
RTFExperimentData >> helperCallsInTestCounts [
	^ self tests collect: #seventh
]

{ #category : #accessing }
RTFExperimentData >> helpers [
	^ helpers
]

{ #category : #accessing }
RTFExperimentData >> helpers: anObject [
	helpers := anObject
]

{ #category : #'computed-metrics' }
RTFExperimentData >> helpersCount [
	^ self helpers size
]

{ #category : #computed }
RTFExperimentData >> maxHelperDepths [
	^ self tests collect: #third
]

{ #category : #'computed-metrics' }
RTFExperimentData >> maximumOfClassDepth [
	^ (self testClassesDepth collect: #second) max
]

{ #category : #'computed-metrics' }
RTFExperimentData >> maximumOfHelperCallDefinitionDelta [
	^ self helperCallDefinitionDelta ifEmpty: [ nil ] ifNotEmpty: #max
]

{ #category : #'computed-metrics' }
RTFExperimentData >> maximumOfHelperCallsInTestCounts [
	^ self helperCallsInTestCounts max
]

{ #category : #'computed-metrics' }
RTFExperimentData >> maximumOfMaxHelperDepths [
	"Return the maximum value for the 'max helper depth' metric."
	^ self maxHelperDepths max
]

{ #category : #'computed-metrics' }
RTFExperimentData >> maximumOfPrimitiveCallsInTestCounts [
	^ self primitiveCallsInTestCounts max
]

{ #category : #'computed-metrics' }
RTFExperimentData >> medianOfClassDepth [
	^ (self testClassesDepth collect: #second) median
]

{ #category : #'computed-metrics' }
RTFExperimentData >> medianOfHelperCallDefinitionDelta [
	^ self helperCallDefinitionDelta ifEmpty: [ nil ] ifNotEmpty: #median
]

{ #category : #'computed-metrics' }
RTFExperimentData >> medianOfHelperCallsInTestCounts [
	^ self helperCallsInTestCounts median
]

{ #category : #'computed-metrics' }
RTFExperimentData >> medianOfMaxHelperDepths [
	"Return the maximum value for the 'max helper depth' metric."
	^ self maxHelperDepths median
]

{ #category : #'computed-metrics' }
RTFExperimentData >> medianOfPrimitiveCallsInTestCounts [
	^ self primitiveCallsInTestCounts median
]

{ #category : #'computed-metrics' }
RTFExperimentData >> minimumOfClassDepth [
	^ (self testClassesDepth collect: #second) min
]

{ #category : #'computed-metrics' }
RTFExperimentData >> minimumOfHelperCallDefinitionDelta [
	^ self helperCallDefinitionDelta ifEmpty: [ nil ] ifNotEmpty: #min
]

{ #category : #'computed-metrics' }
RTFExperimentData >> minimumOfHelperCallsInTestCounts [
	^ self helperCallsInTestCounts min
]

{ #category : #'computed-metrics' }
RTFExperimentData >> minimumOfMaxHelperDepths [
	"Return the minimum value for the 'max helper depth' metric."
	^ self maxHelperDepths min
]

{ #category : #'computed-metrics' }
RTFExperimentData >> minimumOfPrimitiveCallsInTestCounts [
	^ self primitiveCallsInTestCounts min
]

{ #category : #accessing }
RTFExperimentData >> name [
	^ name
]

{ #category : #accessing }
RTFExperimentData >> name: anObject [
	name := anObject
]

{ #category : #'computed-metrics' }
RTFExperimentData >> packagesCount [
	^ self projectData at: 5
]

{ #category : #parsing }
RTFExperimentData >> parseHelperCallsDataIn: aFileReference [
	aFileReference
		readStreamDo: [ :s | 
			self
				helperCalls:
					((NeoCSVReader on: s)
						skipHeader;
						addField;
						addIntegerField;
						addField;
						upToEnd) ]
]

{ #category : #parsing }
RTFExperimentData >> parseHelpersDataIn: aFileReference [
	aFileReference
		readStreamDo: [ :s | 
			self
				helpers:
					((NeoCSVReader on: s)
						skipHeader;
						addField;
						addField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addFieldConverter: [ :str | str = 'true' ];
						addIntegerField;
						addFieldConverter: [ :str | str = 'true' ];
						addIntegerField;
						upToEnd) ]
]

{ #category : #parsing }
RTFExperimentData >> parseProjectIn: aFileReference [
	aFileReference
		readStreamDo: [ :s | 
			self
				projectData:
					(((NeoCSVReader on: s)
						separator: $;;
						skipHeader;
						addField;
						addField;
						addField;
						addField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addField;
						upToEnd) detect: [ :array | array first = self name ]) ]
]

{ #category : #parsing }
RTFExperimentData >> parseTestsDataIn: aFileReference [
	aFileReference
		readStreamDo: [ :s | 
			self
				tests:
					((NeoCSVReader on: s)
						skipHeader;
						addField;
						addField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addFieldConverter: [ :str | str = 'true' ];
						addIntegerField;
						addFieldConverter: [ :str | str = 'true' ];
						addIntegerField;
						upToEnd) ]
]

{ #category : #computed }
RTFExperimentData >> primitiveCallsInTestCounts [
	^ self tests collect: #fourth
]

{ #category : #accessing }
RTFExperimentData >> projectData [
	^ projectData
]

{ #category : #accessing }
RTFExperimentData >> projectData: anObject [
	projectData := anObject
]

{ #category : #computed }
RTFExperimentData >> projectDescription [
	^ self projectData at: 8
]

{ #category : #computed }
RTFExperimentData >> rottenTestsCategory1 [
	"tests containing not executed primitive assertions is characterised by the fact that the developer passed false to the assert primitive."
	^ self allRottenTests select: [ :array | array sixth > 0 ]
]

{ #category : #'computed-metrics' }
RTFExperimentData >> rottenTestsCategory1Count [
	^ self rottenTestsCategory1 size
]

{ #category : #computed }
RTFExperimentData >> rottenTestsCategory2 [
	"Often a test method contains a guard. Depending on the condition of the guard the test method stops its execution early on."
	^ self allRottenTests select: [ :array | array ninth ]
]

{ #category : #'computed-metrics' }
RTFExperimentData >> rottenTestsCategory2Count [
	^ self rottenTestsCategory2 size
]

{ #category : #computed }
RTFExperimentData >> rottenTestsCategory3 [
	"Context dependent assertion"
	^ self allRottenTests select: [ :array | (array at: 10) > 0 ]
]

{ #category : #'computed-metrics' }
RTFExperimentData >> rottenTestsCategory3Count [
	^ self rottenTestsCategory3 size
]

{ #category : #computed }
RTFExperimentData >> rottenTestsCategory4 [
	"Fully rotten tests, rotten tests that are not part of category 1, 2 or 3."
	| cat1 cat2 cat3 |
	cat1 := self rottenTestsCategory1.
	cat2 := self rottenTestsCategory2.
	cat3 := self rottenTestsCategory3.
	^ self allRottenTests reject: [ :array |
		(cat1 includes: array) or: [ (cat2 includes: array) or: [ cat3 includes: array ] ] ]
]

{ #category : #'computed-metrics' }
RTFExperimentData >> rottenTestsCategory4Count [
	"Fully rotten tests, rotten tests that are not part of category 1, 2 or 3."
	^ self rottenTestsCategory4 size
]

{ #category : #'computed-metrics' }
RTFExperimentData >> testClassesCount [
	^ self projectData at: 7
]

{ #category : #computed }
RTFExperimentData >> testClassesDepth [
	^ (self tests collect: [ :array |
		{ (array second splitOn: '>>') first . array at: 12 } ]) asSet asArray
]

{ #category : #computed }
RTFExperimentData >> testPackages [
	^ (self tests collect: #first) asSet
]

{ #category : #'computed-metrics' }
RTFExperimentData >> testPackagesCount [
	^ self testPackages size
]

{ #category : #accessing }
RTFExperimentData >> tests [
	^ tests
]

{ #category : #accessing }
RTFExperimentData >> tests: anObject [
	tests := anObject
]

{ #category : #'computed-metrics' }
RTFExperimentData >> testsCount [
	^ self tests size
]
