Class {
	#name : #BaselineOfRobotsProject,
	#superclass : #BaselineOf,
	#category : #BaselineOfRobotsProject
}

{ #category : #baselines }
BaselineOfRobotsProject >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
    		baseline: 'ContainersArray2D' 
    		with: [ spec repository: 'github://pharo-containers/Containers-Array2D/src' ].
		
		spec 
			package: #'Robots-Board' with: [
				spec requires:  #( #'ContainersArray2D') ] ]
		
		

]
