Class {
	#name : #RbsBoardTest,
	#superclass : #TestCase,
	#category : #'Robots-Board'
}

{ #category : #tests }
RbsBoardTest >> testCreatedBoard [

	| b |
	b := RbsBoard extent: 5@2.
	"	xxxxx
		xxxxx"
	self assert: b width equals: 5.
	self assert: b height equals: 2.
]

{ #category : #tests }
RbsBoardTest >> testCreatedBoardWithExtent [

	| b |
	b := RbsBoard extent: 100@200.
	self assert: b width equals: 100.
	self assert: b height equals: 200.
]

{ #category : #tests }
RbsBoardTest >> testGroundIsSet [

	| b |
	b := RbsBoard new.
	self assert: (b atX: 1 atY: 1) class equals: RbsGround
]

{ #category : #tests }
RbsBoardTest >> testPrintingCreatedBoard [

	| b |
	b := RbsBoard extent: 5@2.
	self assert: b width equals: 5.
	self assert: b height equals: 2.
	self assert: b asciiString equals: '_____
_____'
]

{ #category : #tests }
RbsBoardTest >> testPrintingCreatedBoardWithRobot [

	| rb b |
	rb := RbsAbstractRobot new.
	b := RbsBoard extent: 5@2.
	rb setBoard: b.
	rb x: 4 y: 1.
	self 
		assert: b asciiString 
		equals: '_____
___X_'
]

{ #category : #tests }
RbsBoardTest >> testTileKnowsItsBoard [

	| b |
	b := RbsBoard new.
	self assert: (b atX: 2 atY: 2) board equals: b
]

{ #category : #tests }
RbsBoardTest >> testTilePositionUpdatesBoard [

	| b t |
	b := RbsBoard new.
	t := RbsTile new.
	t setBoard: b.
	t x: 2; y: 2.
	self assert: (b atX: 2 atY: 2) equals: t
]

{ #category : #tests }
RbsBoardTest >> testTilePositionUpdatesBoard2 [

	| b t |
	b := RbsBoard new.
	t := RbsTile new.
	t setBoard: b.
	t x: 3; y: 1.
	self assert: (b atX: 3 atY: 1) equals: t
]
