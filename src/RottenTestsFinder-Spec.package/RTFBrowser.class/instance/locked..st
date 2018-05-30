private
locked: aBoolean
	"Lock or unlock widgets returned by #subwidgetsToLock depending on aBoolean."
	self subwidgetsToLock
		do: [ :subwidget | subwidget enabled: aBoolean ]