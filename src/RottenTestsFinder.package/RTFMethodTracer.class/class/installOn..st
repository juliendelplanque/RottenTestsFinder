instance creation
installOn: methods

	| methodsToInstall |
	
	methodsToInstall := methods select: [ :each | self canInstall: each ].

	wrappers := methodsToInstall collect: [ :m | 
		 (RTFMethodTracer on: m) ].
	
	wrappers do: [ :each | each install ].
	
	