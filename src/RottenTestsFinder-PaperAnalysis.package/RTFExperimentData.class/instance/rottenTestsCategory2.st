computed
rottenTestsCategory2
	"Often a test method contains a guard. Depending on the condition of the guard the test method stops its execution early on."
	^ self allRottenTests select: [ :array | array ninth ]