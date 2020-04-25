Extension { #name : #JbIfElseNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfElseNode >> executeIn: environment [

	(self condition evaluateIn: environment)
	ifTrue: [ trueStatements do: [ :each | each executeIn: environment ] ]
	ifFalse: [ falseStatements do: [ :each | each executeIn: environment ] ]
]
