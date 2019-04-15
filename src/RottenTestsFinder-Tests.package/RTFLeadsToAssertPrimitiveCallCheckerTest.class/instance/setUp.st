initialization
setUp
	tree1 := RTFSelfCallRootNode new
				compiledMethod: (RTFFakeTestClass lookupSelector: #testWithHelperHelper);
				subCalls: { 
					RTFSelfCallRootNode new
						compiledMethod: (RTFFakeTestClass lookupSelector: #helperHelper);
						subCalls: { 
							RTFSelfCallRootNode new
								compiledMethod: (RTFFakeTestClass lookupSelector: #assertHelper);
								subCalls: { 
									RTFSelfCallRootNode new
										compiledMethod: (TestAsserter lookupSelector: #assert:);
										subCalls: #()
									};
								yourself
							};
						yourself
					};
				yourself.
	tree2 := RTFSelfCallRootNode new
				compiledMethod: (RTFFakeTestClass lookupSelector: #testWithNoAssertionInHelperRun);
				subCalls: { 
					RTFSelfCallRootNode new
						compiledMethod: (RTFFakeTestClass lookupSelector: #rottenHelper);
						subCalls: #();
						yourself
					};
				yourself