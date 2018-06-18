initialization
setUp
	tree := RTFSelfCallNode new
				compiledMethod: 'Fake CM';
				subCalls: { 
					RTFSelfCallNode new
						compiledMethod: 'Fake CM 2';
						subCalls: { 
							RTFSelfCallNode new
								compiledMethod: 'Fake CM 3';
								subCalls: { 
									RTFSelfCallNode new
										compiledMethod: TestAsserter >> #assert:;
										subCalls: #()
									};
								yourself.
							RTFSelfCallNode new
								compiledMethod: 'Fake CM 4';
								subCalls: { 
									RTFSelfCallNode new
										compiledMethod: 'Fake CM 5';
										subCalls: { };
										yourself
									};
								yourself
							};
						yourself
					};
				yourself.