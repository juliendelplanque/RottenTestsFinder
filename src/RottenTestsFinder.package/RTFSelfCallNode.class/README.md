I model a node of the call tree which is not the root.

Additionally to my superclass, I store:
- #astNode : The node of the method's AST corresponding to the call I model.
- #hasBeenExecuted : A Boolean allowing to check whether I have been executed or not. This Boolean value is updated by the #metaLink.
- #metaLink : The metaLink which will watch whether I am executed or not and set #hasBeenExecuted accordingly.