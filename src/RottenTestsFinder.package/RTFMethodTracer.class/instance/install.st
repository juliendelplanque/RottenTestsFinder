actions
install
	"Install myself instead of the CompiledMethod in the class holding it.
	 This way, when sending a message to the CompiledMethod (to execute it for example)
	 I am notified and I can remember that the method was run.
	"
	methodClass methodDict
		at: selector
		put: self.