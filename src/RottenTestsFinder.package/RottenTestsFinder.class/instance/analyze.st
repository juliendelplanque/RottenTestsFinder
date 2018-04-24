analyzing
analyze
	[ 
		self
			installMethodTracers;
			runTests
	] ensure: [ self uninstallMethodTracers ]