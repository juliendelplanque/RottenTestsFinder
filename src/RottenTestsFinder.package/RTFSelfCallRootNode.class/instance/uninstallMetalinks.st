metalinks
uninstallMetalinks
	"Recursively uninstall metalinks on all subnodes of the tree."
	self acceptVisitor: RTFRecursiveMetalinksUninstaller new