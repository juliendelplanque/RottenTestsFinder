private
dateAndTimeString
	^ String streamContents: [ :stream |
		|dateAndTime|
		dateAndTime := DateAndTime now.
		dateAndTime printSeparateDateAndTimeOn: stream ]