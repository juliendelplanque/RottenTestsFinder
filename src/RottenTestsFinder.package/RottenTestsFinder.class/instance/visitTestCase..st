visiting
visitTestCase: aTestCase
	| compiledMethod helpers primitiveAssertionsMetalinks helpersMetalinks rootCallNode assertionPrimitiveCallSites assertionPrimitiveMetaLinks |
	testsVisitedCount := testsVisitedCount + 1.
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	rootCallNode := (RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive.
	assertionPrimitiveMetaLinks := OrderedCollection new.
	assertionPrimitiveCallSites := rootCallNode subCalls select: [ :selfCallNode | self class assertionCompiledMethods includes: selfCallNode compiledMethod ].
							
	"helpers := rootCallNode allCompiledMethods \ { compiledMethod }.
	helpers := (helpers \ self class assertionCompiledMethods) asArray."
	
	"Install Metalinks on assertion primitive call sites."
	self flag: #TODO.
	assertionPrimitiveCallSites do: [ :selfCallNode |
		|metalink|
		metalink := MetaLink new
						metaObject: selfCallNode;
						selector: #hasBeenExecuted:;
						arguments: #(true);
						yourself.
		selfCallNode astNode link: metalink.
		assertionPrimitiveMetaLinks add: metalink ].
	
	"Install Metalinks on helper methods call sites."	
	self flag: #TODO.
	Halt if: [ compiledMethod selector = #testWithoutAssertionRun ].
	
	"Run the test, only interesting if green, else ignore."
	aTestCase run hasPassed
		ifFalse: [ "If the test is not green, no need to continue analysis."
			RTFTestAnalysed signalTest: compiledMethod.
			assertionPrimitiveMetaLinks do: #uninstall.	
			^ self ].
	
	self flag: #'Manage expected failures'.
	
	"Uninstall Metalinks on assertion primitive call sites."
	assertionPrimitiveMetaLinks do: #uninstall.	

	"Checks whether test is rotten or not."
	(assertionPrimitiveCallSites allSatisfy: #hasBeenExecuted)
		ifTrue: [  ]
		ifFalse: [ rottenTests addCompiledMethod: compiledMethod ].
	
	RTFTestAnalysed signalTest: compiledMethod