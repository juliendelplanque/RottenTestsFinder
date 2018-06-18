accessing
allCompiledMethods
	"Returns all compiled methods in the call tree."
	| visitor |
	visitor := RTFMethodCallsCollector new.
	self acceptVisitor: visitor.
	^ visitor compiledMethods