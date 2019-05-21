Extension { #name : #RottenTestsFinder }

{ #category : #'*RottenTestsFinder-Spec' }
RottenTestsFinder class >> browser [
	^ RTFBrowser new
]

{ #category : #'*RottenTestsFinder-Spec' }
RottenTestsFinder class >> openBrowser [
	^ self browser
		openWithSpec;
		yourself
]
