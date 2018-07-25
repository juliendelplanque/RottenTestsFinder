visiting
visitTestCase: aTestCase
	"Defines the behaviour while visiting a TestCase.
	 This method must be overrided by users of this trait.
	"
	| compiledMethod analysisResult selfCallTree firstLevelCalls |
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	selfCallTree := [ RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall ] on: Warning do: #resume.
	
	"Collect calls made in the compiled method."
	firstLevelCalls := selfCallTree subCalls collect: [ :node | node compiledMethod selector ].
	Halt if: [ compiledMethod methodClass = RTFRow04HelperNotExecutedAssertionNotExecutedContainsHelperContainsAssertion ].
	"Build results."
	selfCallTree cleanSubTreesNotLeadingToAssertPrimitive.
	analysisResult := RTFTestCaseAnalysisResult new.
	analysisResult
		testCase: aTestCase;
		primitivesCalls: selfCallTree primitiveCompiledMethodCalled;
		helperCalls: selfCallTree helperCompiledMethodCalled;
		branchCalls: (firstLevelCalls select: [ :selector | self branchSelectors includes: selector ]);
		loopCalls: (firstLevelCalls select: [ :selector | self loopSelectors includes: selector ]).
		
	^ analysisResult