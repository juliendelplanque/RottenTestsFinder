private
updateClassesListLabel
	self classesListLabel
		label: (String streamContents: [ :s |
			s
				<< 'Test cases (';
				<< (self classesSelected size);
				<< 'selected):' ])