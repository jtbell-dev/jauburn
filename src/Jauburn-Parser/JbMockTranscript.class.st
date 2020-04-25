"
Mock transcript for unit testing.
"
Class {
	#name : #JbMockTranscript,
	#superclass : #Object,
	#instVars : [
		'stream',
		'contents'
	],
	#category : #'Jauburn-Parser-Mock'
}

{ #category : #streaming }
JbMockTranscript >> contents [
	| result |
	result := ''.
	(self stream contents) do: [ :each | result := result, each ].
	^result 
]

{ #category : #accessing }
JbMockTranscript >> cr [
	self stream show: OSPlatform current lineEnding. 
]

{ #category : #initialization }
JbMockTranscript >> initialize [
	super initialize.
	stream := (OrderedCollection new) writeStream.
	^self
]

{ #category : #streaming }
JbMockTranscript >> show: aString [
	self stream nextPut: aString.
]

{ #category : #accessing }
JbMockTranscript >> stream [
	^ stream
]
