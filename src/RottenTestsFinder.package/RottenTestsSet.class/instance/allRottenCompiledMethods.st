accessing-computed
allRottenCompiledMethods
	"Returns all tests (compiled methods) found to be rotten. That is to say, if the test is implemented in a Trait, the method of each user in which the test is found to be rotten is reported."
	^ self rottenTests flatCollect: [ :rottenTest |
		rottenTest allRottenCompiledMethods ]