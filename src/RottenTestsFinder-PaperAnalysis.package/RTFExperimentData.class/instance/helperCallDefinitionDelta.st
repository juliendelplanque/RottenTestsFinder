computed
helperCallDefinitionDelta
	"Return the list of call/definition deltas.
	 This is an integer representing the number of class separating the class calling the method and the class where the helper is defined.
	 For example, if this number is 0, the helper is defined in the same class as the caller.
	 If the number is 2, the helper is defined 2 classes above in the inheritance hierarchy."
	^ self helperCalls collect: [ :array | array second abs ]