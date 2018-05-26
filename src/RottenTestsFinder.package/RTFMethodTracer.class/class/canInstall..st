testing
canInstall: aCompileMethod
	"Returns wether the method tracer can be installed on a given CompileMethod or not."
	self classesBlackList do: [ :each | (aCompileMethod methodClass == each) ifTrue: [ ^ false ] ].
	
	self methodsBlackList pairsDo: [ :aClass :aSelector |
		(aCompileMethod methodClass == aClass and: [ aCompileMethod selector == aSelector ]) 
			ifTrue: [ ^ false ] ].		
	
	^ true