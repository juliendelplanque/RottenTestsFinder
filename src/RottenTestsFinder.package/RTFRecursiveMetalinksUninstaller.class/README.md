I recursively uninstall metalinks in all helpers methods directly reachable from the node where the visit is started.

Also set the Metalink stored in the RTFSelfCallNode I visit to nil after uninstallation.