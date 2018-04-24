accessing
assertionCompiledMethods
	"Returns the list of CompiledMethods used to assert things during tests."
	^ TestAsserter methodsInProtocol: 'asserting'