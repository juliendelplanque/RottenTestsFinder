visiting
visitTestCase: aTestCase
	"Defines the behaviour while visiting a TestCase.
	 This method must be overrided by users of this trait.
	"
	| compiledMethod analysisResult helpers selfCallTree |
	compiledMethod := aTestCase class lowestCompiledMethodInInheritanceChainNamed: aTestCase selector.
	selfCallTree := [ (RTFSelfCallInterpreter new
							considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
							send: compiledMethod selector fromClass: aTestCase class;
							rootSelfCall) cleanSubTreesNotLeadingToAssertPrimitive ] on: Warning do: #resume.
	helpers := selfCallTree allCompiledMethods \ { compiledMethod }.
	helpers := (helpers \ RottenTestsFinder assertionCompiledMethods) asArray.
	analysisResult := RTFTestCaseAnalysisResult new.
	analysisResult
		testCase: aTestCase;
		primitivesCalls: compiledMethod assertionPrimitiveMethodsCalled;
		helperCalls: helpers.
		
	^ analysisResult