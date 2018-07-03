printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(.
	self testCaseClass printOn: aStream.
	aStream
		<< $).