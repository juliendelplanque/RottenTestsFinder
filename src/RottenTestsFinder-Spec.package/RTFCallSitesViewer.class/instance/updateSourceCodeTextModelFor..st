private
updateSourceCodeTextModelFor: callSite
	self sourceCodeTextModel
		text: callSite source;
		setSelection: callSite sourceInterval