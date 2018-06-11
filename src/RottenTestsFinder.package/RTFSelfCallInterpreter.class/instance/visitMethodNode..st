visiting
visitMethodNode: aRBMethodNode 
	
	aRBMethodNode statements do: [ :each |
		each acceptVisitor: self ]