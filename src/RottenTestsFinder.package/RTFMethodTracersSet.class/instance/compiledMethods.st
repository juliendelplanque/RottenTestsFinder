accessing
compiledMethods
	^ self tracers collect: [ :tracer | tracer method ]