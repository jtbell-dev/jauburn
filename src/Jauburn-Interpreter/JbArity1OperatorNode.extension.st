Extension { #name : #JbArity1OperatorNode }

{ #category : #'*Jauburn-Interpreter' }
JbArity1OperatorNode >> evaluateIn: environment [ 
	| op |
	op := self operand evaluateIn: environment.
	self operator = $-
		ifTrue: [ ^op * -1 ]
]
