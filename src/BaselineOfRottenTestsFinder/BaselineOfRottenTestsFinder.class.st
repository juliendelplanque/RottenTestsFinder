Class {
	#name : #BaselineOfRottenTestsFinder,
	#superclass : #BaselineOf,
	#category : 'BaselineOfRottenTestsFinder'
}

{ #category : #baselines }
BaselineOfRottenTestsFinder >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			package: #'RottenTestsFinder';
			package: #'RottenTestsFinder-GTInspectorExtensions' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-Tests' with: [ spec requires: #('RottenTestsFinder' 'RottenTestsFinder-FakeTests') ];
			package: #'RottenTestsFinder-FakeTests';
			package: #'RottenTestsFinder-PaperTests' with: [ spec requires: #('RottenTestsFinder' 'RottenTestsFinder-FakePaperTests') ];
			package: #'RottenTestsFinder-FakePaperTests';
			package: #'RottenTestsFinder-PaperAnalysis' with: [ spec requires: #('RottenTestsFinder' 'NeoCSV') ].
		spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
		spec
			for: #('pharo7.x' 'pharo6.x')
			do: [ 
				spec
					package: #'RottenTestsFinder' with: [ spec requires: #('SUnitVisitor') ].
					
				spec baseline: 'SUnitVisitor' with: [ 
				spec repository: 'github://juliendelplanque/SUnit-Visitor:v2.0.0/src' ] ] ]
]
