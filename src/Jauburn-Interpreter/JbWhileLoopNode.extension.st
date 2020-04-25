Extension { #name : #JbWhileLoopNode }

{ #category : #'*Jauburn-Interpreter' }
JbWhileLoopNode >> executeIn: environment [

	[self condition evaluateIn: environment]
	whileTrue: [ whileStatements do: [ :each | each executeIn: environment ] ]
]
