baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'SUnit-Visitor' with: [ 
				spec repository: 'github://juliendelplanque/SUnit-Visitor/src' ];
			package: #'RottenTestsFinder' with: [ spec requires: #('SUnit-Visitor') ];
			package: #'RottenTestsFinder-Tests' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-Spec' with: [ spec requires: #('RottenTestsFinder') ] ]