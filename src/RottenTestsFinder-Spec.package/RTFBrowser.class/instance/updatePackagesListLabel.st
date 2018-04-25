private
updatePackagesListLabel
	self packagesListLabel
		label: (String streamContents: [ :s |
			s
				<< 'Packages (';
				<< self packagesSelected size;
				<< ' selected):' ])