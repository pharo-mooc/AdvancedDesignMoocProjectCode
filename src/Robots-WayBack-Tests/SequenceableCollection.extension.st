Extension { #name : #SequenceableCollection }

{ #category : #'*Robots-WayBack-Tests' }
SequenceableCollection >> ifCutOn: isSplitterBlock doWithCutAndUncuts: aTwoArgBlock finally: aBlock [
	"Applies aTwoArgBlock (with current splitter objects and previous unsplit objects) to the receiver. When uncuts are left executes aBlock with them.
	An optimised version could work with indexes to avoid creating intermediate collections."	
	
	| uncuts cut current |
	uncuts := OrderedCollection new. 
	1 to: self size do: [ :i |	
		current := (self at: i).	
		cut := isSplitterBlock value: current.
		cut
			ifFalse: [ uncuts addLast: current ] 
			ifTrue: [ 
					aTwoArgBlock value: current value: uncuts.
					uncuts := OrderedCollection new ]].
	uncuts isEmpty 
		ifFalse: [ aBlock value: uncuts ]
		
	
	 
]
