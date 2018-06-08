testing
anyTracerHasRun
	^ self tracers anySatisfy: [ :tracer | tracer hasRun ]