instance creation
on: aCompiledMethod
	"Initialize the method tracer on aCompiledMethod and returns the method tracer.
	 Do not install the tracer. You need to explicitely call #install on the instance returned to install it.
	"
	(self canInstall: aCompiledMethod)
		ifFalse: [ self error: ('It is forbidden to install myself on a {1}' format: {aCompiledMethod asString}) ].
	^ self basicNew initializeOn: aCompiledMethod