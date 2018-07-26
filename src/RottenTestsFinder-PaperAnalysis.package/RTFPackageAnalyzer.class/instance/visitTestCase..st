visiting
visitTestCase: aTestCase
	"Defines the behaviour while visiting a TestCase.
	 This method must be overrided by users of this trait.
	"
	| compiledMethod analysisResult selfCallTree firstLevelCalls rottenTests |
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	selfCallTree := [ RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall ] on: Warning do: #resume.
	
	"Collect calls made in the compiled method."
	"firstLevelCalls := selfCallTree subCalls collect: [ :node | node compiledMethod selector ]."
	
	"Build results."
	selfCallTree cleanSubTreesNotLeadingToAssertPrimitive.
	rottenTests := [ RottenTestsFinder analyze: aTestCase ] on: Warning do: #resume.
	analysisResult := RTFTestCaseAnalysisResult new.
	analysisResult
		testCase: aTestCase;
		primitivesCalls: selfCallTree primitiveCompiledMethodCalled;
		firstLevelPrimitivesCalls: (selfCallTree subCalls collect: #compiledMethod thenReject: [ :cm | RottenTestsFinder assertionCompiledMethods includes: cm ]);
		helperCalls: selfCallTree helperCompiledMethodCalled;
		firstLevelHelperCalls: (selfCallTree subCalls collect: #compiledMethod thenSelect: [ :cm | RottenTestsFinder assertionCompiledMethods includes: cm ]);
		maxDepth: selfCallTree helperMaxDepth;
		isRotten: (rottenTests isCompiledMethodRotten: compiledMethod);
		helpers: (rottenTests rottenTests select: #isRottenTestHelper)";
		branchCalls: (firstLevelCalls select: [ :selector | self branchSelectors includes: selector ]);
		loopCalls: (firstLevelCalls select: [ :selector | self loopSelectors includes: selector ])".
		
	^ analysisResult