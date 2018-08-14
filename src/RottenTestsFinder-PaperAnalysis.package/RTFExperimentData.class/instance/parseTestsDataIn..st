parsing
parseTestsDataIn: aFileReference
	aFileReference
		readStreamDo: [ :s | 
			self
				tests:
					((NeoCSVReader on: s)
						skipHeader;
						addField;
						addField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addFieldConverter: [ :str | str = 'true' ];
						addIntegerField;
						addFieldConverter: [ :str | str = 'true' ];
						addIntegerField;
						upToEnd) ]