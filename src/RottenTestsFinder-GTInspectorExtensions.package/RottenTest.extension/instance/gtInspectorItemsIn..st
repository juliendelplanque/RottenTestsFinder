*RottenTestsFinder-GTInspectorExtensions
gtInspectorItemsIn: composite
	<gtInspectorPresentationOrder: 0> 
	^ (self callSites gtInspectorItemsIn: composite)
			title: 'Call sites';
			yourself