Class {
	#name : #RTFCallSitesViewer,
	#superclass : #ComposableModel,
	#instVars : [
		'callSitesList',
		'sourceCodeTextModel'
	],
	#category : 'RottenTestsFinder-Spec'
}

{ #category : #specs }
RTFCallSitesViewer class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :mainCol | 
			mainCol
				newRow: [ :row |
					row
						newColumn: [ :callSitesColumn |
							callSitesColumn
								add: #callSitesList ];
						addSplitter;
						newColumn: [ :classesColumn |
							 classesColumn
								add: #sourceCodeTextModel ] ] ];
		yourself
]

{ #category : #accessing }
RTFCallSitesViewer >> callSitesList [
	^ callSitesList
]

{ #category : #initialization }
RTFCallSitesViewer >> initialize [
	super initialize.
	self title: 'Rotten call sites viewer'
]

{ #category : #initialization }
RTFCallSitesViewer >> initializeWidgets [
	
	sourceCodeTextModel := self newText.
	
	sourceCodeTextModel
		beForCode;
		enabled: false.
		
	callSitesList := self newList.
	callSitesList
		whenSelectedItemChanged: [ :callSite |
			callSite ifNotNil: [ 
				self updateSourceCodeTextModelFor: callSite ] ]
]

{ #category : #api }
RTFCallSitesViewer >> onCallSites: aListOfCallSites [
	self callSitesList
		items: aListOfCallSites
]

{ #category : #accessing }
RTFCallSitesViewer >> sourceCodeTextModel [
	^ sourceCodeTextModel
]

{ #category : #private }
RTFCallSitesViewer >> updateSourceCodeTextModelFor: callSite [
	self sourceCodeTextModel
		text: callSite source;
		setSelection: callSite sourceInterval
]
