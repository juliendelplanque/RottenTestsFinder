computed
rottenTestsCategory1
	"tests containing not executed primitive assertions is characterised by the fact that the developer passed false to the assert primitive."
	^ self allRottenTests select: [ :array | array sixth > 0 ]