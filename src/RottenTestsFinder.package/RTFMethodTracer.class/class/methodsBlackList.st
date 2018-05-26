accessing
methodsBlackList
	^ {
		ArrayedCollection. #size.
		SmallInteger. #'\\'.
		ProtoObject. #isNil.
		ProtoObject. #basicIdentityHash.
		Object. #basicAt:.
		Object. #at:put:.
		Behavior. #methodDict.
		HashedCollection. #findElementOrNil:.
		MethodDictionary. #at:put:.
		MethodDictionary. #scanFor:.
		MethodDictionary. #swap:with:.
		BlockClosure. #value:.
		HashedCollection. #fullCheck.
		LargeInteger. #+. 
		Magnitude. #max:.
		Object. #at:.
		ProtoObject. #withArgs:executeMethod:. 
		SequenceableCollection. #do:.
		SmallInteger. #'//'. 
		SmallInteger. #*. 
		SmallInteger. #-. 
		Symbol. #flushCache.
		Number. #isZero. 
		Object. #shallowCopy. 
		OrderedCollection. #do:. 
		ProtoObject. #initialize. 
		SequenceableCollection. #first. 
		SmallInteger. #=.
		TraitBehavior. #methodDict. 
		UndefinedObject. #notNil.
	}