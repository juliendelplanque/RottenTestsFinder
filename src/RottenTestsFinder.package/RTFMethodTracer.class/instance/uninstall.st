actions
uninstall
	"Put the CompiledMethod I replaced back to its place.
	 After this method has been executed, I do not receive CompiledMethod's
	 messages before forwarding them to it anymore.
	"
	methodClass methodDict
		at: selector
		put: method.