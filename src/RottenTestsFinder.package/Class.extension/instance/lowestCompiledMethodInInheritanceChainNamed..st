*RottenTestsFinder
lowestCompiledMethodInInheritanceChainNamed: aSelector
	"Starting from self, look if myself define a CompiledMethod named aSelector.
	 If not, look in my superclasses following the inheritance chain.
	 If no CompiledMethod is used, raise an error."
	^ (self whichClassIncludesSelector: aSelector)
		ifNil: [ self error: 'CompiledMethod does not exist: ' , aSelector ]
		ifNotNil: [ :class | class >> aSelector ]