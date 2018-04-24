allBehaviors := ((Smalltalk globals values select: [ :each | each isClassOrTrait ] ) flatCollect: [ :each | { each. each classSide } ]).

MethodTracer installOn: (allMethods shuffled).
MethodTracer uninstall.
(MethodTracer wrappers select: [ :each | each hasRun ]) size.