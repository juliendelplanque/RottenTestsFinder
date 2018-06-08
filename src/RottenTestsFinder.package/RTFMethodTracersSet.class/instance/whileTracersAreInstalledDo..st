actions
whileTracersAreInstalledDo: aBlock
	[ 
		self installAll.
		aBlock cull: self
	] ensure: [ self uninstallAll ]