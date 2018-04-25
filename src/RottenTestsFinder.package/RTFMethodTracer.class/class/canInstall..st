testing
canInstall: aMethod

		| classBlackList blackList |
	
	classBlackList := {
		RTFMethodTracer. RTFMethodTracer class.
	}.
	
	classBlackList do: [ :each | (aMethod methodClass == each) ifTrue: [ ^ false ] ].
	
	blackList := {
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

		"DelayMicrosecondScheduler. #handleTimerEvent:.
		DelayMicrosecondScheduler. #primSignal:atUTCMicroseconds:. 
		Semaphore. #consumeAllSignals. 
		Semaphore. #wait. "

	}.
	
	blackList pairsDo: [ :aClass :aSelector |
		(aMethod methodClass == aClass and: [ aMethod selector == aSelector ]) 
			ifTrue: [ ^ false ] ].		
	
	^ true