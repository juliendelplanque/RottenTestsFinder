computed
rottenTestsCategory4
	"Fully rotten tests, rotten tests that are not part of category 1, 2 or 3."
	| cat1 cat2 cat3 |
	cat1 := self rottenTestsCategory1.
	cat2 := self rottenTestsCategory2.
	cat3 := self rottenTestsCategory3.
	^ self allRottenTests reject: [ :array |
		(cat1 includes: array) or: [ (cat2 includes: array) or: [ cat3 includes: array ] ] ]