initialization
initialize
	super initialize.
	selfSentMethods := OrderedCollection new.
	callStack := Stack new