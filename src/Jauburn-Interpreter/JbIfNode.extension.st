Extension { #name : #JbIfNode }

{ #category : #'*Jauburn-Interpreter' }
JbIfNode >> executeIn: environment [

	(self condition evaluateIn: environment)
	ifTrue: [ trueStatements do: [ :each | each executeIn: environment ] ]
]
