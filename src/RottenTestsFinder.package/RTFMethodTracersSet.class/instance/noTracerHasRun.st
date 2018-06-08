testing
noTracerHasRun
	^ self tracers noneSatisfy: [ :tracer | tracer hasRun ]