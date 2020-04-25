Extension { #name : #JbReturnStatementNode }

{ #category : #'*Jauburn-Interpreter' }
JbReturnStatementNode >> executeIn: environment [

	| r ex |
	r := self expression evaluateIn: environment.
	ex := JbReturnException new 
				tag: r;
				yourself.
	ex signal.
]
