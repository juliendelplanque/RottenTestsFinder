parsing
parseHelperCallsDataIn: aFileReference
	aFileReference
		readStreamDo: [ :s | 
			self
				helperCalls:
					((NeoCSVReader on: s)
						skipHeader;
						addField;
						addIntegerField;
						addField;
						upToEnd) ]