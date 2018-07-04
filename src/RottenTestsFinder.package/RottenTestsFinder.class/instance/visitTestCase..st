visiting
visitTestCase: aTestCase
	| compiledMethod rootCallNode assertionPrimitiveCallSites assertionPrimitiveMetaLinks helperMetaLinks helperCallSites |
	testsVisitedCount := testsVisitedCount + 1.
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	"Halt if: [ compiledMethod selector = #testWithoutAssertionRun ]."
	rootCallNode := (RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive.
	assertionPrimitiveMetaLinks := OrderedCollection new.
	assertionPrimitiveCallSites := rootCallNode subCalls select: [ :selfCallNode |
												self class assertionCompiledMethods includes: selfCallNode compiledMethod ].
	helperMetaLinks := OrderedCollection new.
	helperCallSites := rootCallNode subCalls reject: [ :selfCallNode |
								self class assertionCompiledMethods includes: selfCallNode compiledMethod ].
	
	"Install Metalinks on assertion primitive call sites."
	assertionPrimitiveCallSites do: [ :selfCallNode |
		|metalink|
		metalink := MetaLink new
						metaObject: selfCallNode;
						selector: #markAsExecuted;
						yourself.
		selfCallNode astNode link: metalink.
		assertionPrimitiveMetaLinks add: metalink ].
	
	"Install Metalinks on helper methods call sites."	
	helperCallSites do: [ :selfCallNode |
		|metalink|
		metalink := MetaLink new
						metaObject: selfCallNode;
						selector: #markAsExecuted;
						yourself.
		selfCallNode astNode link: metalink.
		helperMetaLinks add: metalink ].
	
	"Run the test, only interesting if green, else ignore."
	aTestCase run hasPassed
		ifFalse: [ "If the test is not green, no need to continue analysis."
			RTFTestAnalysed signalTest: compiledMethod.
			assertionPrimitiveMetaLinks do: #uninstall.	
			helperMetaLinks do: #uninstall.
			^ self ].
	
	self flag: #'Manage expected failures'.
	
	"Uninstall Metalinks on assertion primitive call sites."
	assertionPrimitiveMetaLinks do: #uninstall.	
	helperMetaLinks do: #uninstall.

	"Checks whether test is rotten or not."
	(assertionPrimitiveCallSites allSatisfy: #hasBeenExecuted)
		ifFalse: [ 
			compiledMethod origin isTrait "TODO double dispatch"
				ifFalse: [ 
					compiledMethod methodClass = aTestCase class
						ifTrue: [ 
							self rottenTests add: (RottenTest compiledMethod: compiledMethod) ]
						ifFalse: [ "Test is implemented in super class"
							self rottenTests add: (RottenTestImplementedInSuperClass compiledMethod: compiledMethod subclassInWhichTestIsRotten: aTestCase class) ] ]
				ifTrue: [ self rottenTests add: (RottenTestImplementedInTrait compiledMethod: compiledMethod) ] ].
	
	RTFTestAnalysed signalTest: compiledMethod