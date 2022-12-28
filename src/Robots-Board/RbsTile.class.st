"
I'm a tile inside a 2D space.
My subclasses should provide a character based representation so that the board that contains me can be displayed
"
Class {
	#name : #RbsTile,
	#superclass : #Object,
	#instVars : [
		'position',
		'board',
		'x',
		'y'
	],
	#category : #'Robots-Board'
}

{ #category : #'default encoding' }
RbsTile class >> textualMapCharacter [

	^ self subclassResponsibility
]

{ #category : #protected }
RbsTile >> basicPosition: aPosition [
	"A position is a x,y kind of object."
	"to probably remove and introduce basicX: and basicY:"
	x := aPosition x.
	y := aPosition y
]

{ #category : #accessing }
RbsTile >> board [
	^ board 
]

{ #category : #accessing }
RbsTile >> character [

	^ self class textualMapCharacter
]

{ #category : #initialization }
RbsTile >> initialize [ 
	super initialize.
	self basicPosition: 1@1
]

{ #category : #accessing }
RbsTile >> position [

	^ x @ y
]

{ #category : #protected }
RbsTile >> position: aPoint [

	self basicPosition: aPoint.
	self board atX: aPoint x atY: aPoint y put: self
]

{ #category : #move }
RbsTile >> postCreationAction [
	"nothing by default"
	
	^ self
]

{ #category : #printing }
RbsTile >> printOn: aStream [ 

	super printOn: aStream.
	aStream 
		space ; 
		nextPut: self character; 
		space ; 
		print: x ; 
		space ; 
		print: y
]

{ #category : #protected }
RbsTile >> setBoard: aBoard [
	board := aBoard
]

{ #category : #accessing }
RbsTile >> x [

	^ x
]

{ #category : #accessing }
RbsTile >> x: anInteger [
	"may be we should update the previous position."
	x := anInteger.
	self board atX: x atY: y put: self
]

{ #category : #accessing }
RbsTile >> x: xCoord y: yCoord [
	"may be we should update the previous position."
	x := xCoord.
	y := yCoord.
	self board atX: x atY: y put: self
]

{ #category : #accessing }
RbsTile >> y [

	^ y
]

{ #category : #accessing }
RbsTile >> y: anInteger [
	"may be we should update the previous position."

	y := anInteger.
	self board atX: x atY: y put: self
]
