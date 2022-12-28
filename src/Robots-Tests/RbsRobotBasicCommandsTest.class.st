Class {
	#name : #RbsRobotBasicCommandsTest,
	#superclass : #TestCase,
	#category : #'Robots-Tests'
}

{ #category : #tests }
RbsRobotBasicCommandsTest >> testExecuteCommandBased [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb executeCommandBased: 
'dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4
]

{ #category : #tests }
RbsRobotBasicCommandsTest >> testExecuteCommandDirection [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb executeCommandBased: 
'dir #east'.
	self assert: rb direction equals: #east
]

{ #category : #tests }
RbsRobotBasicCommandsTest >> testExecuteMovCommandBased [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb x: 4 y: 1.
	rb executeCommandBased: 
'mov 2
mov 3'.
	self assert: rb position equals: 9@1
]

{ #category : #tests }
RbsRobotBasicCommandsTest >> testMappingIsInitialized [

	| r |
	r := RbsRobot new.
	self assert: (r commandClassFor: RbsDirectionCommand commandName) equals: RbsDirectionCommand
]

{ #category : #'tests - printing commands' }
RbsRobotBasicCommandsTest >> testPrintString [

	self 
		assert: (RbsMoveCommand new distance: 5; printString)
		equals: 'mov 5'
]

{ #category : #tests }
RbsRobotBasicCommandsTest >> testStartPositionAsCommand [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb executeCommandBased: 
'base 4 1
dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4
]
