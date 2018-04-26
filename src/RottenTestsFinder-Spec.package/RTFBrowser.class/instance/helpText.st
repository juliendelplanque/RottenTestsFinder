accessing
helpText
	^ 'RottenTestsFinder helps you to find rotten tests in your unit tests.

A rotten test is a test method that refers to one of the method in "asserting" protocol of TestAsserter in its source code but does not call it during the execution.

## Analyse your tests
To start the analysis, you must:
1. Select one or many packages in the left list of the UI.
2. Select one or many test classes from the selected packages in the center list of the UI (those selected test classes will be analyzed).
3. Click on the "Start analysis" button.
4. The rotten tests found by the analysis are available in the right list of the UI (double click on an entry of the list or select an entry and click the "Browse test" button to open the class browser on the rotten test).

## Using RTF from ST code
RottenTestsFinder can also be used without the UI part.

To do that, simply use the following code snippet:

```
RottenTestsFinder analyze: target
```

where `target` can either be a class inheriting from TestCase, an instance of TestCase or an instance of TestSuite.
'