"
I am the UI part of the RottenTestsFinder written using Spec framework.

Open myself using:
[[[
	RTFBrowser new openWithSpec
]]]

Or even better:
[[[
	RottenTestsFinder openBrowser
]]]
"
Class {
	#name : #RTFBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'packagesList',
		'packagesListLabel',
		'classesList',
		'classesListLabel',
		'resultsList',
		'resultsListLabel',
		'startButton',
		'browseButton',
		'toolbar',
		'statusLabel'
	],
	#category : 'RottenTestsFinder-Spec'
}

{ #category : #specs }
RTFBrowser class >> defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :mainCol | 
			mainCol
				newRow: #toolbar height: self toolbarHeight;
				newRow: [ :row |
					row
						newColumn: [ :packagesColumn |
							packagesColumn
								add: #packagesListLabel height: self labelHeight;
								add: #packagesList ];
						addSplitter;
						newColumn: [ :classesColumn |
							 classesColumn
								add: #classesListLabel height: self labelHeight;
								add: #classesList ];
						addSplitter;
						newColumn: [ :resultsColumn |
							resultsColumn
								add: #resultsListLabel height: self labelHeight;
								add: #resultsList;
								add: #browseButton height: self buttonHeight ] ];
				newRow: #startButton height: self buttonHeight;
				newRow: #statusLabel height: self labelHeight ];
		yourself
]

{ #category : #accessing }
RTFBrowser class >> labelHeight [
	^ StandardFonts defaultFont height + 2
]

{ #category : #accessing }
RTFBrowser >> browseButton [
	^ browseButton
]

{ #category : #actions }
RTFBrowser >> browseSelectedTest [
	self resultSelected rtfBrowserBrowse
]

{ #category : #accessing }
RTFBrowser >> classesList [
	^ classesList
]

{ #category : #accessing }
RTFBrowser >> classesListLabel [
	^ classesListLabel
]

{ #category : #accessing }
RTFBrowser >> classesSelected [
	^ self classesList ifNil: [ #() ] ifNotNil: #selectedItems
]

{ #category : #private }
RTFBrowser >> dateAndTimeString [
	^ String streamContents: [ :stream |
		|dateAndTime|
		dateAndTime := DateAndTime now.
		dateAndTime printSeparateDateAndTimeOn: stream ]
]

{ #category : #accessing }
RTFBrowser >> helpText [
	^ 'RottenTestsFinder helps you to find rotten tests in your unit tests.

A rotten test is a test method that refers to one of the method in "asserting" protocol of TestAsserter in its source code but does not call it during the execution.

## Analyse your tests
To start the analysis, you must:
1. Select one or many packages in the left list of the UI.
2. Select one or many test classes from the selected packages in the center list of the UI (those selected test classes will be analyzed).
3. Click on the "Start analysis" button.
4. The rotten tests found by the analysis are available in the right list of the UI (double click on an entry of the list or select an entry and click the "Browse test" button to open the class browser on the rotten test).

## Using RTF from ST code
RottenTestsFinder can also be used without the UI part.

To do that, simply use the following code snippet:

```
RottenTestsFinder analyze: target
```

where `target` can either be a class inheriting from TestCase, an instance of TestCase or an instance of TestSuite.
'
]

{ #category : #initialization }
RTFBrowser >> initialize [
	super initialize.
	self
		title: 'Rotten Tests Finder' translated;
		updateStatus: 'Welcome in Rotten Tests Finder!' translated
]

{ #category : #initialization }
RTFBrowser >> initializeToolbar [
	toolbar := MenuModel new
		addGroup: [ :group | 
			group
				addItem: [ :item | 
					item
						name: 'Help';
						icon: (self iconNamed: #glamorousHelp);
						action: [ self openHelp ] ] ].
	toolbar applyTo: self.
]

{ #category : #initialization }
RTFBrowser >> initializeWidgets [
	packagesListLabel := self newLabel.
	self updatePackagesListLabel.
	packagesListLabel help: 'Select the packages to analyze. Cmd+A or Ctrl+A to select all packages.'.
	
	packagesList :=  self instantiate: FastTableModel.
	packagesList
		items: (RPackage organizer packages select: [ :p |
			p definedClasses anySatisfy: [ :c | c allSuperclasses includes: TestCase ] ]);
		sortingBlock: [ :a :b | a name < b name ];
		displayBlock: [ :package | package name ];
		beMultipleSelection.
	
	classesListLabel := self newLabel.
	self updateClassesListLabel.
	classesListLabel help: 'Select the classes to analyze. Cmd+A or Ctrl+A to select all classes.'.
	
	classesList :=  self instantiate: FastTableModel.
	
	classesList
		sortingBlock: [ :a :b | a name < b name ];
		whenSelectionChanged: [ self updateClassesListLabel ];
		beMultipleSelection.
	
	packagesList whenSelectionChanged: [ 
		self whenPackagesSelectionChanged: self packagesSelected ].
			
	resultsListLabel := self newLabel.
	self updateResultsListLabel.
	resultsListLabel help: 'The rotten tests found during latest analysis. Double click on a test to browse it in the class browser.'.
	
	resultsList := self instantiate: FastTableModel.
	
	resultsList
		displayBlock: [ :rottenTest |
			rottenTest rtfBrowserName ];
		doubleClickAction: [ 
			self browseSelectedTest ];
		sortingBlock: [ :a :b | a rtfBrowserName < b rtfBrowserName ];
		menu: [ :menu | self menuForSelectedResult: menu. menu ].
	
	startButton := self newButton.
	
	startButton
		label: 'Start analysis' translated;
		help: 'Run the analysis to find rotten tests.';
		action: [ self startAnalysis ].
	
	browseButton := self newButton.
	
	browseButton
		label: 'Browse test' translated;
		help: 'Browse the rotten test selected in the results list.';
		action: [ self browseSelectedTest ].
		
	self initializeToolbar.
	
	statusLabel := self newLabel.
]

{ #category : #private }
RTFBrowser >> lock [
	"Lock the UI, once this method is called, the user is not able to click on buttons or lists anymore."
	self locked: false
]

{ #category : #private }
RTFBrowser >> locked: aBoolean [
	"Lock or unlock widgets returned by #subwidgetsToLock depending on aBoolean."
	self subwidgetsToLock
		do: [ :subwidget | subwidget enabled: aBoolean ]
]

{ #category : #private }
RTFBrowser >> menuForSelectedResult: menu [
	self resultSelected ifNil: [ ^ self ].
	
	self resultSelected
		rtfBuilderBuildContextMenu: menu
]

{ #category : #actions }
RTFBrowser >> openHelp [
	TextModel new
		enabled: false;
		title: 'Help';
		text: self helpText;
		openWithSpec
]

{ #category : #accessing }
RTFBrowser >> packagesList [
	^ packagesList
]

{ #category : #accessing }
RTFBrowser >> packagesListLabel [
	^ packagesListLabel
]

{ #category : #accessing }
RTFBrowser >> packagesSelected [
	^ self packagesList ifNil: [ #() ] ifNotNil: #selectedItems
]

{ #category : #accessing }
RTFBrowser >> resultSelected [
	^ self resultsList selectedItem
]

{ #category : #accessing }
RTFBrowser >> resultsList [
	^ resultsList
]

{ #category : #accessing }
RTFBrowser >> resultsListLabel [
	^ resultsListLabel
]

{ #category : #actions }
RTFBrowser >> startAnalysis [
	| suite |
	[
		self lock.
		self updateStatus: ('Analysis started ({1}).' format: { self dateAndTimeString }).
		suite := TestSuite new.
		self classesSelected collect: #suite thenDo: [ :s |
			suite addTests: s tests ].
	
		UIManager default informUserDuring: [ :bar |
			[
				[	
					|results|
					results := RottenTestsFinder analyze: suite.
					self resultsList
						items: results rottenTests;
						resetSelection.
				] on: Warning do: [ :warning |
					Transcript
						show: warning messageText;
						cr.
					warning resume ]
			] on: RTFTestAnalysed do: [ :notif |
				bar label: ('Analyzing test: {1}' format: { notif compiledMethod printString }).
				notif resume ] ]. 
		
		self updateResultsListLabel.
		self updateStatus: ('Analysis finished ({1}).' format: { self dateAndTimeString }).
	] ensure: [ self unlock ]
]

{ #category : #accessing }
RTFBrowser >> startButton [
	^ startButton
]

{ #category : #accessing }
RTFBrowser >> statusLabel [
	^ statusLabel
]

{ #category : #private }
RTFBrowser >> subwidgetsToLock [
	^ { self packagesList. self classesList. self resultsList. self startButton. self browseButton }
]

{ #category : #accessing }
RTFBrowser >> toolbar [
	^ toolbar
]

{ #category : #private }
RTFBrowser >> unlock [
	"Unlock the UI, once this method is called, the user is able to click on buttons or lists and to launch analysis."
	self locked: true
]

{ #category : #private }
RTFBrowser >> updateClassesListLabel [
	self classesListLabel
		label: (String streamContents: [ :s |
			s
				<< 'Test cases (';
				<< (self classesSelected size);
				<< ' selected):' ])
]

{ #category : #private }
RTFBrowser >> updatePackagesListLabel [
	self packagesListLabel
		label: (String streamContents: [ :s |
			s
				<< 'Packages (';
				<< self packagesSelected size;
				<< ' selected):' ])
]

{ #category : #private }
RTFBrowser >> updateResultsListLabel [
	self resultsListLabel
		label: (String streamContents: [ :s |
			s
				<< 'Rotten tests (';
				<< (self resultsList ifNil: [ 0 ] ifNotNil: [ :list | list listItems size ]);
				<< '):' ])
]

{ #category : #private }
RTFBrowser >> updateStatus: aString [
	self statusLabel
		label: aString
]

{ #category : #private }
RTFBrowser >> whenPackagesSelectionChanged: packagesSelected [
	classesList resetSelection.
	classesList items: (packagesSelected collect: [ :p | 
		p definedClasses select: [ :c | c allSuperclasses includes: TestCase ] ]) flattened.
	self updatePackagesListLabel
]
