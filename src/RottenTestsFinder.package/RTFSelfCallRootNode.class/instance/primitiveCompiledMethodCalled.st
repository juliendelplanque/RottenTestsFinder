accessing
primitiveCompiledMethodCalled
	| visitor |
	visitor := RTFPrimitiveCallsCollector new.
	self acceptVisitor: visitor.
	^ visitor primitiveCalls