"
Unit tests for the JbInterpreter class.
"
Class {
	#name : #JbInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'parser'
	],
	#category : #'Jauburn-Interpreter-Tests'
}

{ #category : #utilities }
JbInterpreterTest >> interpret: aString [

	| ast |
	ast :=  parser parse: aString.
	^interpreter interpret: ast.
	
]

{ #category : #running }
JbInterpreterTest >> setUp [ 

	parser := JbParser new.
	interpreter := JbInterpreter new
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testAbsBinding [
	self interpret: 'var result1 = abs(-14);'.
	self assert: (interpreter environment at: 'result1') equals: 14.
	
	self interpret: 'var result2 = abs(36);'.
	self assert: (interpreter environment at: 'result2') equals: 36.
 	
]

{ #category : #utilities }
JbInterpreterTest >> testArithmeticDivide [

	self interpret: 'var x = 28 / 7; x = x / 2;'.
	self assert: (interpreter environment at: 'x') equals: 2.
	
	self interpret: 'var y = -56 / 2;'.
	self assert: (interpreter environment at: 'y') equals: -28.
]

{ #category : #utilities }
JbInterpreterTest >> testArithmeticMinus [

	self interpret: 'var x = -3; x = x - 4;'.
	self assert: (interpreter environment at: 'x') equals: -7.
	
	self interpret: 'var y = 27 - 5; y = y - 3;'.
	self assert: (interpreter environment at: 'y') equals: 19.
]

{ #category : #utilities }
JbInterpreterTest >> testArithmeticMultiply [

	self interpret: 'var x = -3 * 5; x = x * -2;'.
	self assert: (interpreter environment at: 'x') equals: 30.
	
	self interpret: 'var y = 27 * 2; y = y * -3;'.
	self assert: (interpreter environment at: 'y') equals: -162.
]

{ #category : #utilities }
JbInterpreterTest >> testArithmeticPlus [

	self interpret: 'var x = -3; x = x + 4;'.
	self assert: (interpreter environment at: 'x') equals: 1.
	
	self interpret: 'var y = 27 + 5; y = y + 3;'.
	self assert: (interpreter environment at: 'y') equals: 35.
]

{ #category : #utilities }
JbInterpreterTest >> testArithmeticUnaryNegation [

	self interpret: 'var x = -28;'.
	self assert: (interpreter environment at: 'x') equals: -28.
	
	"adding negated values"
	self interpret: 'var y = -54 + -6;'.
	self assert: (interpreter environment at: 'y') equals: -60.
	
	"adding negated values using parenthesis"
	self interpret: 'var y = -50 + (-6);'.
	self assert: (interpreter environment at: 'y') equals: -56.
	
]

{ #category : #utilities }
JbInterpreterTest >> testAssignmentOverwritesVariable [

	self interpret: 'var x = 99; x = 45;'.
	self assert: (interpreter environment at: 'x') equals: 45.
	
	self interpret: 'var y = -12; y = -157;'.
	self assert: (interpreter environment at: 'y') equals: -157.
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionEqualTo [

	self interpret: 'var x = 4 == 7;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 4; var y = 8; var z = x == y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
	self interpret: 'var x = -3; var y = -3; var z = x == y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionGreaterThan [

	self interpret: 'var x = 4 > 7;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 4; var y = 8; var z = x > y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
	self interpret: 'var x = -3; var y = -3; var z = x > y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
	self interpret: 'var x = -3; var y = -5; var z = x > y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionGreaterThanOrEqualTo [

	self interpret: 'var x = 4 >= 7;'.
	self assert: (interpreter environment at: 'x') equals: false.
	
	self interpret: 'var x = 4; var y = 8; var z = x >= y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
	self interpret: 'var x = -3; var y = -3; var z = x >= y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
	self interpret: 'var x = -3; var y = -5; var z = x >= y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionLessThan [

	self interpret: 'var x = 4 < 7;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 4; var y = 8; var z = x < y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
	self interpret: 'var x = -3; var y = -3; var z = x < y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
	self interpret: 'var x = -3; var y = -5; var z = x < y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionLessThanOrEqualTo [

	self interpret: 'var x = 4 <= 7;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 4; var y = 8; var z = x <= y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
	self interpret: 'var x = -3; var y = -3; var z = x <= y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
	self interpret: 'var x = -3; var y = -5; var z = x <= y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionNotEqualTo [

	self interpret: 'var x = 4 != 7;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var x = 4; var y = 8; var z = x != y;'.
	self assert: (interpreter environment at: 'z') equals: true.
	
	self interpret: 'var x = -3; var y = -3; var z = x != y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
]

{ #category : #utilities }
JbInterpreterTest >> testBooleanExpressionValues [

	self interpret: 'var x = true;'.
	self assert: (interpreter environment at: 'x') equals: true.
	
	self interpret: 'var y = false; var z = y;'.
	self assert: (interpreter environment at: 'z') equals: false.
	
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testConcatBinding [

	"test two strings"
	self interpret: 'var result = concat("abc", "123");'.
	self assert: (interpreter environment at: 'result') equals: 'abc123'.
	
	"test a string and a number"
	self interpret: 'var result = concat("abc", 123);'.
	self assert: (interpreter environment at: 'result') equals: 'abc123'.
	
 	
]

{ #category : #tests }
JbInterpreterTest >> testDecimalValue [
	self interpret: 'var val = (1 / 2) * 101;'.
	self assert: (interpreter environment at: 'val') equals: 50.5
	
]

{ #category : #running }
JbInterpreterTest >> testDeclarationBindsVariableToExpressionValue [

	self interpret: 'var x = 3 + 2 * 8;'.
	self assert: (interpreter environment at: 'x') equals: 19.
	
	self interpret: 'var x = 6;var y = 2*x;'.
	self assert: (interpreter environment at: 'y') equals: 12
]

{ #category : #running }
JbInterpreterTest >> testDeclarationCreatesVariable [

	self interpret: 'var x = 99;'.
	self assert: (interpreter environment includesKey: 'x')
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCallWithReturnStatement [

	"function call changes value of global variable"
	self interpret: '
	var x = 4;
	var y = 12;
	var fSum = function (a, b) { return a + b; };
	var s = fSum(x, y);'.	
	self assert: (interpreter environment at: 's') equals: 16.
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCallWithReturnStatementNested [

	"function call evaluates using variable from global scope, not function body scope."
	self interpret: '
	var x = 4;
	var f = function () { return x * x; };
	var g = function (aFunction) { var x = 10; return aFunction(); }; 
	var s = g(f);'.	
	self assert: (interpreter environment at: 's') equals: 16.
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCalls [

	"function call changes value of global variable"
	self interpret: '
	var x = 0;
	var testFunc = function () { x = 10; };
	testFunc();'.
	self assert: (interpreter environment at: 'x') equals: 10.
	
	"function doesn't call itself on definition"
	self interpret: '
	var x = 0;
	var testFunc = function () { x = 10; };'.
	self assert: (interpreter environment at: 'x') equals: 0.
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCallsWithArguments [

	"function call changes value of global variable"
	self interpret: '
	var x = 0;
	var y = 0;
	var z = 0; 
	var testFunc = function (a, b, c) { x = a; y = b; z = c; };
	testFunc(4, 5, 6);'.
	self assert: (interpreter environment at: 'x') equals: 4.
	self assert: (interpreter environment at: 'y') equals: 5.
	self assert: (interpreter environment at: 'z') equals: 6.
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionCallsWithExpressionsAsArguments [

	"function call changes value of global variables"
	self interpret: '
	var x = 0;
	var y = 0;
	var z = 0; 
	var testFunc = function (a, b, c) { x = a; y = b; z = c; };
	testFunc(5+6, 33-4, 16*-2);'.
	self assert: (interpreter environment at: 'x') equals: 11.
	self assert: (interpreter environment at: 'y') equals: 29.
	self assert: (interpreter environment at: 'z') equals: -32.
	
]

{ #category : #tests }
JbInterpreterTest >> testFunctionDefinition [
	self interpret: 'var testFunc = function (a, b) { return a + b; };'.
	self assert: (interpreter environment includesKey: 'testFunc').
	self assert: (interpreter environment at: 'testFunc') body size equals: 1.
	self assert: (interpreter environment at: 'testFunc') parameters size equals: 2.
	self assert: (interpreter environment at: 'testFunc') parameters first equals: 'a'.
	self assert: (interpreter environment at: 'testFunc') parameters second equals: 'b'.
	self assert: (interpreter environment at: 'testFunc') environment equals: (interpreter environment).
	
]

{ #category : #utilities }
JbInterpreterTest >> testIfElseStatement [
	
	"true"
	self interpret: '	var y = 7;
							if (true) { y = y * 2; }
						  else { y = y - 2; }'.
	self assert: (interpreter environment at: 'y') equals: 14.
	
	"false"
	self interpret: '	var y = 7;
							if (false) { y = y * 2; }
						  else { y = y - 2; }'.
	self assert: (interpreter environment at: 'y') equals: 5.
	
]

{ #category : #utilities }
JbInterpreterTest >> testIfStatement [
	
	"variable as conditional + brackets"
	self interpret: 'var x = true; var y = 7; if (x) { y = 14; }'.
	self assert: (interpreter environment at: 'y') equals: 14.
	
	"body is not run if false condition"
	self interpret: 'var z = 12; if (false) { z = z + 15; }'.
	self assert: (interpreter environment at: 'z') equals: 12.
	
	"no statements in body"
	self interpret: 'var z = 42; if (false) {  }'.
	self assert: (interpreter environment at: 'z') equals: 42.
	
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testInputBinding [
	| mm |
	mm := JbMockUIManager new.
	interpreter uiManager: mm.
	self interpret: 'var result = input("What is the capital of Assyria?");'.
	self assert: interpreter uiManager request equals: 'What is the capital of Assyria?'
 	
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testLengthBinding [
	self interpret: 'var result1 = length("The quick brown fox jumps over the lazy dog");'.
	self assert: (interpreter environment at: 'result1') equals: 43.
	
	self interpret: 'var result2 = length("");'.
	self assert: (interpreter environment at: 'result2') equals: 0.
 	
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testModBinding [
	self interpret: 'var result1 = mod(24, 14);'.
	self assert: (interpreter environment at: 'result1') equals: 10.
	
	self interpret: 'var result2 = mod(24, 24);'.
	self assert: (interpreter environment at: 'result2') equals: 0.
	
	self interpret: 'var result3 = mod(24, 5);'.
	self assert: (interpreter environment at: 'result3') equals: 4.
 	
	self interpret: 'var result3 = mod(-24, 5);'.
	self assert: (interpreter environment at: 'result3') equals: 1.
]

{ #category : #'tests-sample-programs' }
JbInterpreterTest >> testNoFunctions [

	self interpret: JbSamplePrograms noFunctions.
	self assert: (interpreter environment at: 'x') equals: 16.
	self assert: (interpreter environment at: 'y') equals: 9.
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testNotBinding [
	self interpret: 'var result1 = not(true);'.
	self assert: (interpreter environment at: 'result1') equals: false.
	
	self interpret: 'var result2 = not(false);'.
	self assert: (interpreter environment at: 'result2') equals: true.
	
	self interpret: 'var result3 = not(3 <= -1);'.
	self assert: (interpreter environment at: 'result3') equals: true.
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testPrintBinding [
	| mt |
	mt := JbMockTranscript new.
	interpreter transcript: mt.
	self interpret: 'print("Hello, there!");'.
	self assert: interpreter transcript contents equals: '''Hello, there!'''.
 	
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testPrintlnBinding [
	| mt |
	mt := JbMockTranscript new.
	interpreter transcript: mt.
	self interpret: 'println("Hello, there!");'.
	self assert: interpreter transcript contents equals: 'Hello, there!' printString, OSPlatform current lineEnding.
 	
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testStringToNumberBinding [
	self interpret: 'var result1 = stringToNumber("43");'.
	self assert: (interpreter environment at: 'result1') equals: 43.
	
	self interpret: 'var result2 = stringToNumber("-6174");'.
	self assert: (interpreter environment at: 'result2') equals: -6174.
	
	self interpret: 'var s = "145"; var result3 = stringToNumber(s);'.
	self assert: (interpreter environment at: 'result3') equals: 145.
]

{ #category : #'tests-primitives' }
JbInterpreterTest >> testWhileLoopInFunction [
	self interpret: '
	var sum1to10 = function () {  
		var sum = 0;
		var x = 1;
		while (x <= 10) { 
			sum = sum + x;
			x = x + 1;
		}
		return sum;
	};
	
	var g = sum1to10();
	
	'.
	self assert: (interpreter environment at: 'g') equals: 55.
]
