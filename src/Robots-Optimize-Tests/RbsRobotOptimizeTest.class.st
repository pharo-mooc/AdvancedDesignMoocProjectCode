Class {
	#name : #RbsRobotOptimizeTest,
	#superclass : #TestCase,
	#category : #'Robots-Optimize-Tests'
}

{ #category : #'tests - merge' }
RbsRobotOptimizeTest >> testMergeDirectionCommandsReturnTheLastOne [

	| cmdList |
	cmdList := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsDirectionCommand new direction: #north ; yourself).
	self assert: cmdList size equals: 1.
	self assert: cmdList first direction equals: #north.
]

{ #category : #'tests - merge' }
RbsRobotOptimizeTest >> testMergeMoveCommandsProducesTheSum [

	| cmdList |
	cmdList := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmdList size equals: 1.
	self assert: cmdList first distance equals: 20.
]

{ #category : #'tests - merge' }
RbsRobotOptimizeTest >> testMergeUNmergeableCommandsBecauseDifferent2 [

	| cmdList |
	cmdList := (RbsDirectionCommand new direction: #east; yourself)
		mergeWith: (RbsMoveCommand new distance: 10; yourself).
	self assert: cmdList size equals: 2.
	self assert: cmdList first direction equals: #east
]

{ #category : #'tests - merge' }
RbsRobotOptimizeTest >> testMergeUnmergeableCommandsBecauseDifferent [

	| cmdList |
	cmdList := (RbsMoveCommand new distance: 10; yourself)
		mergeWith: (RbsDirectionCommand new direction: #east; yourself).
	self assert: cmdList size equals: 2.
	self assert: cmdList first distance equals: 10.
	
	
	
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testOptimizeMergeThreeMoves2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
mov 4'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9') asOrderedCollection
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testOptimizeMergeThreeMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 9' 'dir #east') asOrderedCollection
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testOptimizeMergeTwoMoves2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5') asOrderedCollection
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testOptimizeMergeTwoMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'mov 2
mov 3
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'mov 5' 'dir #east') asOrderedCollection
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testOptimizeNoMergeThenMergeThreeMovesAndOthers2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #north
mov 2
mov 3
mov 4
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #north' 'mov 9' 'dir #east') asOrderedCollection 
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testOptimizeTwoDirections2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #north
dir #east'.
	self 
		assert: (rb path collect: [ :each | each printString ]) 
		equals: #( 'dir #east') asOrderedCollection
]

{ #category : #'tests - optimize' }
RbsRobotOptimizeTest >> testToOptimizeAPathWeNeedAtLeastTwoElements2 [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb optimizePath: 
'dir #east'.
	self 
		assert: rb path first printString 
		equals: 'dir #east'
]
