Class {
	#name : #RTFPackageAnalyzer,
	#superclass : #SUnitVisitor,
	#category : #'RottenTestsFinder-PaperAnalysis'
}

{ #category : #testing }
RTFPackageAnalyzer class >> analyze: aVisitableObject [
	| visitor |
	visitor := self new.
	^ aVisitableObject acceptSUnitVisitor: visitor
]

{ #category : #accessing }
RTFPackageAnalyzer class >> contextSelectors [
	^ #(#ifTrue: #ifFalse: #ifTrue:ifFalse: #ifFalse:ifTrue: #ifNil: #ifNil:ifNotNil: #ifNotNil:ifNil: #ifNotNil:)
]

{ #category : #accessing }
RTFPackageAnalyzer >> branchSelectors [
	^ #(#ifTrue: #ifFalse: #ifTrue:ifFalse: #ifFalse:ifTrue: #ifNil: #ifNil:ifNotNil: #ifNotNil:ifNil: #ifNotNil: #at:ifAbsent: #at:ifAbsentPut: #detect:ifNone: #on:do: #and: #or: #xor: #& #|)
]

{ #category : #accessing }
RTFPackageAnalyzer >> contextSelectors [
	^ self class contextSelectors
]

{ #category : #accessing }
RTFPackageAnalyzer >> loopSelectors [
	^ #(#whileTrue: #whileTrue #whileFalse #whileFalse: #timesRepeat: #to:do: #do:separatedBy: #do: #collect: #select: #reject: #inject:into: #detect: #detect:ifNone: #anySatisfy: #allSatisfy: #piecesCutWhere:)
]

{ #category : #visiting }
RTFPackageAnalyzer >> visitRPackage: aRPackage [
	^ RTFRPackageAnalysisResult new
		package: aRPackage;
		testCaseClassesAnalysisResults: (super visitRPackage: aRPackage);
		yourself
]

{ #category : #visiting }
RTFPackageAnalyzer >> visitTestCase: aTestCase [
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
		rottenTests: rottenTests;
		primitivesCalls: selfCallTree primitiveCompiledMethodCalled;
		firstLevelPrimitivesCalls: (selfCallTree subCalls select: #isCallToAssertPrimitive thenCollect: #compiledMethod);
		helperCalls: selfCallTree helperCompiledMethodCalled;
		firstLevelHelperCalls: (selfCallTree subCalls reject: #isCallToAssertPrimitive thenCollect: #compiledMethod);
		maxDepth: selfCallTree helperMaxDepth;
		isRotten: (rottenTests isCompiledMethodRotten: compiledMethod);
		helpers: (rottenTests rottenTests select: #isRottenTestHelper thenCollect: #compiledMethod);
		assertCallSitesGettingFalseLiteral: ((rottenTests rottenTestForCompiledMethod: compiledMethod ifPresent: [ :rt | rt callSites ] ifAbsent: [ #() ])
															ifNotEmpty: [ :callSites |
																(callSites select: [ :callSite |
																	(callSite selector = #assert: or: [ callSite selector = #assert:description: ])
																		and: [ callSite arguments first isLiteralNode
																			and: [ callSite arguments first value not ] ] ]) ]);
		testContainsReturn: compiledMethod ast body containsReturn;
		contextDependentRottenAsserts: ((rottenTests rottenTestForCompiledMethod: compiledMethod ifPresent: [ :rt | rt callSites ] ifAbsent: [ #() ])
															ifNotEmpty: [ :callSites |
																(callSites select: [ :callSite |
																	self contextSelectors includes: callSite rtfContext selector ]) ])";
		branchCalls: (firstLevelCalls select: [ :selector | self branchSelectors includes: selector ]);
		loopCalls: (firstLevelCalls select: [ :selector | self loopSelectors includes: selector ])".
		
	^ analysisResult
]

{ #category : #visiting }
RTFPackageAnalyzer >> visitTestCaseClass: aTestCaseClass [
	^ RTFTestCaseClassAnalysisResult new
		testCaseClass: aTestCaseClass;
		testCaseAnalysisResults: (super visitTestCaseClass: aTestCaseClass);
		yourself
]
