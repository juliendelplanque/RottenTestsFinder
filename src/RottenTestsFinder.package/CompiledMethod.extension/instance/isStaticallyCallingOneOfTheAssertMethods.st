*RottenTestsFinder
isStaticallyCallingOneOfTheAssertMethods
	"If, with a static analysis I am calling one of the methods in the TestAssert's 'asserting' protocol, returns true.
	Else, returns false."
	^ (self messages intersection: RottenTestsFinder assertionSelectors) isNotEmpty