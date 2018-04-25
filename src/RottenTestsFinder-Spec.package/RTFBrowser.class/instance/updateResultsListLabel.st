private
updateResultsListLabel
	self resultsListLabel
		label: (String streamContents: [ :s |
			s
				<< 'Rotten tests (';
				<< (self resultsList ifNil: [ 0 ] ifNotNil: [ :list | list listItems size ]);
				<< '):' ])