actions
whileTracersAreInstalledDo: aBlock
	[ 
		self installAll.
		aBlock value: self
	] ensure: [ self uninstallAll ]