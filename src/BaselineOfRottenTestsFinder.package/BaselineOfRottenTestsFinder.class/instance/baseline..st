baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'SUnitVisitor' with: [ 
				spec repository: 'github://juliendelplanque/SUnit-Visitor:v1.1.1/src' ];
			project: 'NeoCSV' with: [
			spec
				className: 'ConfigurationOfNeoCSV';
				version: #stable;
				repository: 'http://smalltalkhub.com/mc/SvenVanCaekenberghe/Neo/main';
				load ];
			package: #'RottenTestsFinder' with: [ spec requires: #('SUnitVisitor') ];
			package: #'RottenTestsFinder-GTInspectorExtensions' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-Tests' with: [ spec requires: #('RottenTestsFinder' 'RottenTestsFinder-FakeTests') ];
			package: #'RottenTestsFinder-FakeTests';
			package: #'RottenTestsFinder-PaperTests' with: [ spec requires: #('RottenTestsFinder' 'RottenTestsFinder-FakePaperTests') ];
			package: #'RottenTestsFinder-FakePaperTests';
			package: #'RottenTestsFinder-Spec' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-PaperAnalysis' with: [ spec requires: #('RottenTestsFinder' 'NeoCSV') ] ]