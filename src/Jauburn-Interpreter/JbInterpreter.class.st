"
I am an interpreter for programs written in the Jauburn language.  My principle API methods are:

	interpret: anAST -- given an abstract syntax tree, interpret it
	run: aString -- parse and interpret the supplied string
"
Class {
	#name : #JbInterpreter,
	#superclass : #Object,
	#instVars : [
		'environment',
		'transcript',
		'uiManager'
	],
	#category : #'Jauburn-Interpreter-Core'
}

{ #category : #primitives }
JbInterpreter >> absBinding [
	^ #abs -> [ :f | f abs ]
]

{ #category : #primitives }
JbInterpreter >> concatBinding [
	^ #concat -> [ :v1 :v2 | v1 asString, v2 asString ]
]

{ #category : #accessing }
JbInterpreter >> environment [ 

	^environment
]

{ #category : #initialization }
JbInterpreter >> initialize [ 

	super initialize.
	environment := JbEnvironment new.
	self initializeEnvBindings.
]

{ #category : #initialization }
JbInterpreter >> initializeEnvBindings [
(self class selectors select: [ :each | each endsWith: 'Binding' ])
do: [ :s |
| binding |
binding := self perform: s.
"environment at: binding key put: binding value ]"
environment at: binding key put: (JbPrimitive new 
												block: (binding value);
												yourself) ]
]

{ #category : #primitives }
JbInterpreter >> inputBinding [
^ #input -> [ :v | 
	self uiManager request: v]
]

{ #category : #api }
JbInterpreter >> interpret: ast [

	^ast executeIn: environment 
]

{ #category : #primitives }
JbInterpreter >> lengthBinding [
	^ #length -> [ :v1 | v1 size ]
]

{ #category : #primitives }
JbInterpreter >> modBinding [
	^ #mod -> [ :a :b | a % b ]
]

{ #category : #primitives }
JbInterpreter >> notBinding [
	^ #not -> [ :b | b not ]
]

{ #category : #primitives }
JbInterpreter >> printBinding [
	^ #print -> [ :value | self transcript show: value printString ]
]

{ #category : #primitives }
JbInterpreter >> printlnBinding [
	^ #println -> [ :value | self transcript show: (value printString, OSPlatform current lineEnding)]
]

{ #category : #api }
JbInterpreter >> run: programString [

	| parser |
	parser := JbParser new.
	self interpret: (parser parse: programString)
]

{ #category : #primitives }
JbInterpreter >> stringToNumberBinding [
	^ #'stringToNumber' -> [ :s | s asNumber ]
]

{ #category : #accessing }
JbInterpreter >> transcript [
	^ transcript ifNil: [ Transcript ]
]

{ #category : #accessing }
JbInterpreter >> transcript: anObject [
	transcript := anObject
]

{ #category : #accessing }
JbInterpreter >> uiManager [
	^ uiManager ifNil: [ UIManager default ]
]

{ #category : #accessing }
JbInterpreter >> uiManager: anObject [
	uiManager := anObject
]
