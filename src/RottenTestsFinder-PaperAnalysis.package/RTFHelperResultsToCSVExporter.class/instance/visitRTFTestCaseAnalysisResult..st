visiting
visitRTFTestCaseAnalysisResult: aRTFTestCaseAnalysisResult

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
						selfCallTree helperMaxDepth.
						selfCallTree primitiveCompiledMethodCalled size.
						(selfCallTree subCalls reject: #isCallToAssertPrimitive thenCollect: #compiledMethod) size.
						selfCallTree helperCompiledMethodCalled size.
						(selfCallTree subCalls select: #isCallToAssertPrimitive thenCollect: #compiledMethod) size.
						isRotten
			 } ] ]