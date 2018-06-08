accessing
compiledMethodsForTracersRun
	^ self tracersRun collect: [ :tracer | tracer method ]