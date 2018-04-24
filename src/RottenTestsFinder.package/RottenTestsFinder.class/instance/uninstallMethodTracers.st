private
uninstallMethodTracers
	tracers do: [ :tracer | tracer uninstall ].
	tracers := #()