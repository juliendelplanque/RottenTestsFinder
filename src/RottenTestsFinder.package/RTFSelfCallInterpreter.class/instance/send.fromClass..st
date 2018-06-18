api
send: aSelector fromClass: aClass
	
	| method |
	selfClass := aClass.
	method := selfClass lookupSelector: aSelector.
	
	callStack push: (RTFSelfCallNode compiledMethod: method).
	method ast acceptVisitor: self.
	rootSelfCall := callStack pop