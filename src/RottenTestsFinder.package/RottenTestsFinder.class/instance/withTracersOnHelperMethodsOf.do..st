private
withTracersOnHelperMethodsOf: aClass do: aBlock
	"Install tracers on non-test methods calling an assert-like method of aClass."
	| testHelperMethods helperMethodsTracers |
	testHelperMethods := aClass testHelperMethods.
	helperMethodsTracers := testHelperMethods collect: [ :method |
										RTFMethodTracer on: method ].
	helperMethodsTracers do: [ :tracer | tracer install ].
	[
		aBlock value: helperMethodsTracers
	] ensure: [ helperMethodsTracers do: [ :tracer | tracer uninstall ] ]