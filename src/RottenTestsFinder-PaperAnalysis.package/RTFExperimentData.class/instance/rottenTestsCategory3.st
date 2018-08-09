computed
rottenTestsCategory3
	"Context dependent assertion"
	^ self allRottenTests select: [ :array | (array at: 10) > 0 ]