cleaning
cleanSubTreesNotLeadingToAssertPrimitive
	self acceptVisitor: RTFSelfCallTreeCleaner new.
	^ self