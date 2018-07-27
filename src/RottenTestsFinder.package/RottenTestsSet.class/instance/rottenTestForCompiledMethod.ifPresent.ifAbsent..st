accessing
rottenTestForCompiledMethod: aCompiledMethod ifPresent: ifPresentBlock ifAbsent: ifAbsentBlock
	^ self rottenTests
		detect: [ :rottenTest | rottenTest compiledMethod = aCompiledMethod ]
		ifFound: ifPresentBlock
		ifNone: ifAbsentBlock