visiting
visitArrayNode: aRBArrayNode 
	aRBArrayNode statements do: [ :statement | statement acceptVisitor: self ]