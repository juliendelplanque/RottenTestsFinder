accessing
helperCompiledMethodCalled
	| visitor |
	visitor := RTFHelperCallsCollector new.
	self acceptVisitor: visitor.
	^ visitor helperCalls