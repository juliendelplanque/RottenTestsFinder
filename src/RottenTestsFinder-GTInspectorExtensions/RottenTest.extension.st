Extension { #name : #RottenTest }

{ #category : #'*RottenTestsFinder-GTInspectorExtensions' }
RottenTest >> gtInspectorItemsIn: composite [
	<gtInspectorPresentationOrder: 0> 
	^ (self callSites gtInspectorItemsIn: composite)
			title: 'Call sites';
			yourself
]
