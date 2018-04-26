initialization
initializeToolbar
	toolbar := MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Help';
						icon: (self iconNamed: #glamorousHelp);
						action: [ 
							TextModel new
								enabled: false;
								title: 'Help';
								text: self helpText;
								openWithSpec ] ] ].
	toolbar applyTo: self.