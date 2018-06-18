cleaning
cleanSubTreesNotLeadingToAssertPrimitive
	self acceptVisitor: RTFSelfCallTreeCleaner.
	^ self