visiting
visitTestCase: aTestCase
	| compiledMethod rootCallNode callSites |
	testsVisitedCount := testsVisitedCount + 1.
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	
	rootCallNode := (RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive.
	
	callSites := rootCallNode subCalls.
	
	rootCallNode installMetalinks.
	
	"Run the test, only interesting if green, else ignore."
	[ 
		|testResult|
		testResult := aTestCase run.
		(testResult hasPassed and: [ aTestCase isExpectedFailure not and: [ testResult skippedCount = 0 ] ])
			ifFalse: [ "If the test is not green, no need to continue analysis."
				RTFTestAnalysed signalTest: compiledMethod.
				^ self ].
	] ensure: [ 
		testsRunCount := testsRunCount + 1.
		rootCallNode uninstallMetalinks ].

	"Checks whether test is rotten or not (i.e. is there an assertion primitive or helper call site not executed)."
	(callSites allSatisfy: #hasBeenExecuted)
		ifFalse: [ 
			self rottenTests
				add: ((compiledMethod origin generateRottenTestFromCompiledMethod: compiledMethod testCase: aTestCase)
							callSites: (callSites reject: #hasBeenExecuted thenCollect: #astNode);
							yourself) ].
	
	"Checks whether there is rotten helpers or not."
	callSites
		select: [ :callSite | callSite isCallToAssertPrimitive not and: [ callSite hasBeenExecuted ] ]
		thenDo: [ :selfCallNode |
			|visitor|
			visitor := RTFRottenHelpersFinder new.
			selfCallNode acceptVisitor: visitor.
			self rottenTests addAll: visitor rottenHelpers ].
	
	
	RTFTestAnalysed signalTest: compiledMethod