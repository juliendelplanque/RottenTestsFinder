visiting
visitTestCase: aTestCase
	| compiledMethod rootCallNode assertionPrimitiveCallSites helperCallSites |
	testsVisitedCount := testsVisitedCount + 1.
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	
	rootCallNode := (RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive.
	
	assertionPrimitiveCallSites := rootCallNode subCalls select: [ :selfCallNode |
												self class assertionCompiledMethods includes: selfCallNode compiledMethod ].
	helperCallSites := rootCallNode subCalls reject: [ :selfCallNode |
								self class assertionCompiledMethods includes: selfCallNode compiledMethod ].
	
	rootCallNode installMetalinks.
	
	"Run the test, only interesting if green, else ignore."
	[ 
		(aTestCase run hasPassed and: [ aTestCase isExpectedFailure not ])
			ifFalse: [ "If the test is not green, no need to continue analysis."
				RTFTestAnalysed signalTest: compiledMethod.
				^ self ].
	] ensure: [ 
		testsRunCount := testsRunCount + 1.
		rootCallNode uninstallMetalinks ].

	"Checks whether test is rotten or not (i.e. is there an assertion primitive or helper call site not executed)."
	((assertionPrimitiveCallSites allSatisfy: #hasBeenExecuted) and: [ helperCallSites allSatisfy: #hasBeenExecuted ])
		ifFalse: [ 
			self rottenTests
				add: ((compiledMethod origin generateRottenTestFromCompiledMethod: compiledMethod testCase: aTestCase)
							callSites: (assertionPrimitiveCallSites reject: #hasBeenExecuted thenCollect: #astNode),(helperCallSites reject: #hasBeenExecuted thenCollect: #astNode);
							yourself) ].
	
	"Checks whether there is rotten helpers or not."
	helperCallSites select: #hasBeenExecuted thenDo: [ :selfCallNode |
		|visitor|
		visitor := RTFRottenHelpersFinder new.
		selfCallNode acceptVisitor: visitor.
		self rottenTests addAll: visitor rottenHelpers ].
	
	
	RTFTestAnalysed signalTest: compiledMethod