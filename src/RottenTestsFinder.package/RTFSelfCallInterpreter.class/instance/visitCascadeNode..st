visiting
visitCascadeNode: aRBCascadeNode 
	aRBCascadeNode messages do: [ :message |
		message acceptVisitor: self ]