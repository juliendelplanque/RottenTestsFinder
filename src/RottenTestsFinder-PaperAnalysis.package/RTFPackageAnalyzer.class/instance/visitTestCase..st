as yet unclassified
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
		firstLevelPrimitivesCalls: (selfCallTree subCalls select: #isCallToAssertPrimitive thenCollect: #compiledMethod);
		helperCalls: selfCallTree helperCompiledMethodCalled;
		firstLevelHelperCalls: (selfCallTree subCalls reject: #isCallToAssertPrimitive thenCollect: #compiledMethod);
		maxDepth: selfCallTree helperMaxDepth;
		isRotten: (rottenTests isCompiledMethodRotten: compiledMethod);
		helpers: (rottenTests rottenTests select: #isRottenTestHelper thenCollect: #compiledMethod);
		allAssertCallSitesGetFalseLiteral: ((rottenTests rottenTestForCompiledMethod: compiledMethod ifPresent: [ :rt | rt callSites ] ifAbsent: [ #() ])
															ifEmpty: [ nil ]
															ifNotEmpty: [ :callSites |
																callSites allSatisfy: [ :callSite |
																	callSite selector = #assert:
																		and: [ callSite arguments first isLiteralNode
																			and: [ callSite arguments first value not ] ] ] ]);
		testContainsReturn: compiledMethod ast body containsReturn";
		branchCalls: (firstLevelCalls select: [ :selector | self branchSelectors includes: selector ]);
		loopCalls: (firstLevelCalls select: [ :selector | self loopSelectors includes: selector ])".
		
	^ analysisResult