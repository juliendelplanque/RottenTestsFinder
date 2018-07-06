metalinks
installMetalinks
	"Recursively install metalinks on all subnodes of the tree."
	self acceptVisitor: RTFRecursiveMetalinksInstaller new