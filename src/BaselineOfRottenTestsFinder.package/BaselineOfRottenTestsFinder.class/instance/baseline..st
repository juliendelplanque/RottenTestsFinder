baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			package: #'RottenTestsFinder';
			package: #'RottenTestsFinder-Tests' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-Spec' with: [ spec requires: #('RottenTestsFinder') ] ]