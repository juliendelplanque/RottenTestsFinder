initialization
initializeToolbar
	toolbar := MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Help';
						icon: (self iconNamed: #glamorousHelp);
						action: [ self openHelp ] ] ].
	toolbar applyTo: self.