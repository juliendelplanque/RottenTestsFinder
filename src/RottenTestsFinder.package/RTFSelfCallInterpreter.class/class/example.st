example
example
	^ RTFSelfCallInterpreter new
		considerClassesThat: [ :class | class inheritsFrom: Collection ];
		send: #select: fromClass: OrderedCollection;
		rootSelfCall