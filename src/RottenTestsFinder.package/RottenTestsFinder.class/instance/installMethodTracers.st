private
installMethodTracers
	tracers := self assertionCompiledMethods collect: [ :compiledMethod |
		RTFMethodTracer on: compiledMethod ].
	
	tracers do: [ :tracer | tracer install ]