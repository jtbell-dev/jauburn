Extension { #name : #JbFunctionCallNode }

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> evaluateIn: environment [

	^(environment at: self identifier) call: (self arguments) in: environment.
]

{ #category : #'*Jauburn-Interpreter' }
JbFunctionCallNode >> executeIn: environment [
	(environment at: self identifier) call: arguments in: environment
]
