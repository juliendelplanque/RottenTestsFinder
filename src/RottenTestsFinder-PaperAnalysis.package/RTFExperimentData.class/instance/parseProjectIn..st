parsing
parseProjectIn: aFileReference
	aFileReference
		readStreamDo: [ :s | 
			self
				projectData:
					(((NeoCSVReader on: s)
						separator: $;;
						skipHeader;
						addField;
						addField;
						addField;
						addField;
						addIntegerField;
						addIntegerField;
						addIntegerField;
						addField;
						upToEnd) detect: [ :array | array first = self name ]) ]