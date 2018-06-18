initialization
setUp
	tree1 := RTFSelfCallNode new
				compiledMethod: (RTFFakeTestClass >> #testWithHelperHelper);
				subCalls: { 
					RTFSelfCallNode new
						compiledMethod: RTFFakeTestClass >> #helperHelper;
						subCalls: { 
							RTFSelfCallNode new
								compiledMethod: RTFFakeTestClass >> #assertHelper;
								subCalls: { 
									RTFSelfCallNode new
										compiledMethod: TestAsserter >> #assert:;
										subCalls: #()
									};
								yourself
							};
						yourself
					};
				yourself.
	tree2 := RTFSelfCallNode new
				compiledMethod: (RTFFakeTestClass >> #testWithNoAssertionInHelperRun);
				subCalls: { 
					RTFSelfCallNode new
						compiledMethod: RTFFakeTestClass >> #rottenHelper;
						subCalls: #();
						yourself
					};
				yourself