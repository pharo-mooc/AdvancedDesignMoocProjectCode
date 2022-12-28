"
I'm a empty subclass so that all the objects can be packaged in the same package and that the tests work. Robot developers should subclass me to define their own robot.

"
Class {
	#name : #RbsAbstractRobot,
	#superclass : #RbsTile,
	#instVars : [
		'previousTile'
	],
	#category : #'Robots-Board'
}

{ #category : #'default encoding' }
RbsAbstractRobot class >> textualMapCharacter [
	^ $X
]

{ #category : #'instance creation' }
RbsAbstractRobot >> x: xCoord y: yCoord [
	previousTile := self board atX: xCoord atY: yCoord.
	super x: xCoord y: yCoord.
	
]
