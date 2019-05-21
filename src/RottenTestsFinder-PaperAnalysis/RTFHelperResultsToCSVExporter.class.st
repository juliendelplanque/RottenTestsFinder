Class {
	#name : #RTFHelperResultsToCSVExporter,
	#superclass : #RTFResultsToCSVExporter,
	#instVars : [
		'alreadyVisitedMethods'
	],
	#category : 'RottenTestsFinder-PaperAnalysis'
}

{ #category : #csv }
RTFHelperResultsToCSVExporter >> addHeader [
	self neoCSV
		nextPut: #(
			'Package'
			'Method'
			'Max helper depth'
			'Primitives calls in test count'
			'All primitives calls involved in execution count'
			'Not-executed #assert: getting false literal as parameter'
			'Helpers calls in test count'
			'All helpers calls involved in execution count'
			'Test contains return'
			'Context dependent rotten assert count'
			'Is rotten'
			'Test case depth')
]

{ #category : #initialization }
RTFHelperResultsToCSVExporter >> initialize [
	super initialize.
	alreadyVisitedMethods := Set new
]

{ #category : #visiting }
RTFHelperResultsToCSVExporter >> visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult [

	| dict |
	dict := Dictionary new.
	
	(aRTFTestCaseAnalysisResult helperCalls asSet \ aRTFTestCaseAnalysisResult helpers)
		do: [ :compiledMethod | dict at: compiledMethod put: false ].
	
	aRTFTestCaseAnalysisResult helpers
		do: [ :compiledMethod | dict at: compiledMethod put: true ].
		
	dict keysAndValuesDo: [ :compiledMethod :isRotten |
		|selfCallTree|
		(alreadyVisitedMethods anySatisfy: [ :visitedMethod | visitedMethod methodClass = compiledMethod methodClass and: [ visitedMethod selector = compiledMethod selector ] ])
			ifFalse: [
				alreadyVisitedMethods add: compiledMethod.
				selfCallTree := [ RTFSelfCallInterpreter new
									considerClassesThat: [ :class | class inheritsFrom: TestAsserter ];
									send: compiledMethod selector fromClass: compiledMethod methodClass;
									rootSelfCall ] on: Warning do: #resume.
				selfCallTree cleanSubTreesNotLeadingToAssertPrimitive.
				self neoCSV
					nextPut: { 
						self currentPackageName.
						compiledMethod printString.
						selfCallTree helperMaxDepth. "prof max"
						selfCallTree primitiveCompiledMethodCalled size. "# assert sur le premier niveau"
						(selfCallTree subCalls select: #isCallToAssertPrimitive thenCollect: #compiledMethod) size. "# assert impliqués dans l'execution"
						((aRTFTestCaseAnalysisResult rottenTests rottenTestForCompiledMethod: compiledMethod ifPresent: [ :rt | rt callSites ] ifAbsent: [ #() ])
															ifNotEmpty: [ :callSites |
																(callSites select: [ :callSite |
																	(callSite selector = #assert: or: [ callSite selector = #assert:description: ])
																		and: [ callSite arguments first isLiteralNode
																			and: [ callSite arguments first value not ] ] ]) ]) size.
						selfCallTree helperCompiledMethodCalled size. "# helpers sur le premier niveau"
						(selfCallTree subCalls reject: #isCallToAssertPrimitive thenCollect: #compiledMethod) size. "# helpers impliqués dans l'execution"
						compiledMethod ast body containsReturn.
						((aRTFTestCaseAnalysisResult rottenTests rottenTestForCompiledMethod: compiledMethod ifPresent: [ :rt | rt callSites ] ifAbsent: [ #() ])
															ifNotEmpty: [ :callSites |
																(callSites select: [ :callSite |
																	RTFPackageAnalyzer contextSelectors includes: callSite rtfContext selector ]) ]) size.
						isRotten.
						compiledMethod origin classDepth - TestCase classDepth "Class depth"
			 } ] ]
]
