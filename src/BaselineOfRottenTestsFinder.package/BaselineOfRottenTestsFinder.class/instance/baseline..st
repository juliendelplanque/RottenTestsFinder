baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'SUnitVisitor' with: [ 
				spec repository: 'github://juliendelplanque/SUnit-Visitor:v1.0.0/src' ];
			package: #'RottenTestsFinder' with: [ spec requires: #('SUnitVisitor') ];
			package: #'RottenTestsFinder-Tests' with: [ spec requires: #('RottenTestsFinder') ];
			package: #'RottenTestsFinder-Spec' with: [ spec requires: #('RottenTestsFinder') ] ]