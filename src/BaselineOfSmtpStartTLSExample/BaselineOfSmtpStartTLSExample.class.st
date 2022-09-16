Class {
	#name : #BaselineOfSmtpStartTLSExample,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmtpStartTLSExample
}

{ #category : #baselines }
BaselineOfSmtpStartTLSExample >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self seaside: spec.
		spec
			package: 'SmtpStartTLSExample'
			with: [ spec requires: #( 'Seaside3' ) ] ]
]

{ #category : #baselines }
BaselineOfSmtpStartTLSExample >> seaside: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
]
