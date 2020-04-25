"
JbWhileLoopNode class.
"
Class {
	#name : #JbWhileLoopNode,
	#superclass : #Object,
	#instVars : [
		'condition',
		'whileStatements'
	],
	#category : #'Jauburn-AST-Core'
}

{ #category : #accessing }
JbWhileLoopNode >> condition [
	^ condition
]

{ #category : #accessing }
JbWhileLoopNode >> condition: anObject [
	condition := anObject
]

{ #category : #accessing }
JbWhileLoopNode >> whileStatements [
	^ whileStatements
]

{ #category : #accessing }
JbWhileLoopNode >> whileStatements: anObject [
	whileStatements := anObject
]
