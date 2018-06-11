visiting
visitBlockNode: aRBBlockNode 
	
	aRBBlockNode statements do: [ :each |
		each acceptVisitor: self ]