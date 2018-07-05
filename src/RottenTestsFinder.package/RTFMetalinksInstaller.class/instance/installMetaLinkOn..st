private
installMetaLinkOn: aRTFSelfCallNode
	|metalink|
	metalink := MetaLink new
					metaObject: aRTFSelfCallNode;
					selector: #markAsExecuted;
					yourself.
	aRTFSelfCallNode astNode link: metalink.
	aRTFSelfCallNode metaLink: metalink