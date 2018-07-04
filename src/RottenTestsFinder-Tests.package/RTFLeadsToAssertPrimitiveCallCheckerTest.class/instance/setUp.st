initialization
setUp
	tree1 := RTFSelfCallRootNode new
				compiledMethod: (RTFFakeTestClass >> #testWithHelperHelper);
				subCalls: { 
					RTFSelfCallRootNode new
						compiledMethod: RTFFakeTestClass >> #helperHelper;
						subCalls: { 
							RTFSelfCallRootNode new
								compiledMethod: RTFFakeTestClass >> #assertHelper;
								subCalls: { 
									RTFSelfCallRootNode new
										compiledMethod: TestAsserter >> #assert:;
										subCalls: #()
									};
								yourself
							};
						yourself
					};
				yourself.
	tree2 := RTFSelfCallRootNode new
				compiledMethod: (RTFFakeTestClass >> #testWithNoAssertionInHelperRun);
				subCalls: { 
					RTFSelfCallRootNode new
						compiledMethod: RTFFakeTestClass >> #rottenHelper;
						subCalls: #();
						yourself
					};
				yourself