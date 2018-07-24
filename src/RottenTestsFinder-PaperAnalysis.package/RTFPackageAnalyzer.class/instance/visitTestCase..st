visiting
visitTestCase: aTestCase
	"Defines the behaviour while visiting a TestCase.
	 This method must be overrided by users of this trait.
	"
	| compiledMethod analysisResult selfCallTree |
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	selfCallTree := [ (RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive ] on: Warning do: #resume.
	analysisResult := RTFTestCaseAnalysisResult new.
	analysisResult
		testCase: aTestCase;
		primitivesCalls: selfCallTree primitiveCompiledMethodCalled;
		helperCalls: selfCallTree helperCompiledMethodCalled.
		
	^ analysisResult