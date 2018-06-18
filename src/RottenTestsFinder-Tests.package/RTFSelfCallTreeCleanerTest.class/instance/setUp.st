initialization
setUp
	tree1 := RTFSelfCallNode new
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
	tree2 := RTFSelfCallNode new
				compiledMethod: 'Fake CM';
				subCalls: { 
					RTFSelfCallNode new
						compiledMethod: 'Fake CM 2';
						subCalls: #();
						yourself
					};
				yourself