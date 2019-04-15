initialization
setUp
	tree := RTFSelfCallRootNode new
				compiledMethod: 'Fake CM';
				subCalls: { 
					RTFSelfCallRootNode new
						compiledMethod: 'Fake CM 2';
						subCalls: { 
							RTFSelfCallRootNode new
								compiledMethod: 'Fake CM 3';
								subCalls: { 
									RTFSelfCallRootNode new
										compiledMethod: (TestAsserter lookupSelector: #assert:);
										subCalls: #()
									};
								yourself.
							RTFSelfCallRootNode new
								compiledMethod: 'Fake CM 4';
								subCalls: { 
									RTFSelfCallRootNode new
										compiledMethod: 'Fake CM 5';
										subCalls: { };
										yourself
									};
								yourself
							};
						yourself
					};
				yourself.