baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'SUnitVisitor' with: [ 
				spec repository: 'github://juliendelplanque/SUnit-Visitor:v1.1.1/src' ];
			package: #'RottenTestsFinder' with: [ spec requires: #('SUnitVisitor') ];
			package: #'RottenTestsFinder-GTInspectorExtensions' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-Tests' with: [ spec requires: #('RottenTestsFinder' 'RottenTestsFinder-FakeTests') ];
			package: #'RottenTestsFinder-FakeTests';
			package: #'RottenTestsFinder-PaperTests' with: [ spec requires: #('RottenTestsFinder' 'RottenTestsFinder-FakePaperTests') ];
			package: #'RottenTestsFinder-FakePaperTests' ]