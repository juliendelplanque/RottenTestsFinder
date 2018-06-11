api
send: aSelector fromClass: aClass
	
	| method |
	selfClass := aClass.
	method := selfClass lookupSelector: aSelector.
	method ast acceptVisitor: self.