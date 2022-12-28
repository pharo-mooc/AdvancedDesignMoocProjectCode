Class {
	#name : #RbsRobotReplayTest,
	#superclass : #TestCase,
	#category : #'Robots-Tests'
}

{ #category : #tests }
RbsRobotReplayTest >> testAddToPathCommands [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
mov 3'.
	self assert: rb path size equals: 3
	
]

{ #category : #tests }
RbsRobotReplayTest >> testAddToPathCommandsDoesNotContainReplay [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
mov 3
replay'.
	self assert: rb path size equals: 3
	
]

{ #category : #tests }
RbsRobotReplayTest >> testMonitoringIsOnPerDefault [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
stopM
mov 3'.
	self assert: rb path size equals: 2
	
]

{ #category : #tests }
RbsRobotReplayTest >> testReplay [

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
	self assert: rb position equals: 9@4.
	rb x: 5 y: 1.
	rb replay.
	self assert: rb position equals: 10@4
	
]

{ #category : #tests }
RbsRobotReplayTest >> testReplayAsCommand [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.
	rb executeCommandBased: 
'base 4 1'.
	rb executeCommandBased: 
'resM
dir #east
mov 2
mov 3
dir #north
mov 3'.
	self assert: rb position equals: 9@4.
rb executeCommandBased: 'stopM
base 5 1
replay'.
	self assert: rb position equals: 10@4
	
]

{ #category : #tests }
RbsRobotReplayTest >> testReset [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
resM
mov 3'.
	self assert: rb path size equals: 1.
	self assert: rb path first printString equals: 'mov 3'
	
]

{ #category : #tests }
RbsRobotReplayTest >> testStartStop [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
stopM
mov 3'.
	self assert: rb path size equals: 2
	
]

{ #category : #tests }
RbsRobotReplayTest >> testStopAndReset [

	| rb b |
	rb := RbsRobot new.
	b := RbsBoard new.
	rb setBoard: b.	
	rb executeCommandBased: 
'base 5 1 
dir #east
stopM
resM
mov 3'.
	self assert: rb path size equals: 0
	
]
