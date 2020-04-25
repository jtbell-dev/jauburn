"
Mock UI Manager for unit testing.
"
Class {
	#name : #JbMockUIManager,
	#superclass : #Object,
	#instVars : [
		'request'
	],
	#category : #'Jauburn-Parser-Mock'
}

{ #category : #accessing }
JbMockUIManager >> request [
	^ request
]

{ #category : #accessing }
JbMockUIManager >> request: anObject [
	request := anObject
]
