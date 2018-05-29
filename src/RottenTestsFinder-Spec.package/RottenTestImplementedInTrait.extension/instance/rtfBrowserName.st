*RottenTestsFinder-Spec
rtfBrowserName
	^ String streamContents: [ :s |
		self compiledMethod origin printOn: s.
		s
			<< '>>#';
			<< self compiledMethod selector;
			<< $[.
		self traitUsersInWhichTestIsRotten size printOn: s.
		s << $] ]