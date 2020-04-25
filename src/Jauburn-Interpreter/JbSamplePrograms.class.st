"
Just a place to house a few sample programs
"
Class {
	#name : #JbSamplePrograms,
	#superclass : #Object,
	#category : #'Jauburn-Interpreter-SamplePrograms'
}

{ #category : #'sample programs' }
JbSamplePrograms class >> gcdProgram [

	^'
	
	var gcd = function (a, b) { 
		if (a == 0) { 
			return b;
		}
		
		if (b == 0) { 
			return a;
		}
		
		var n1 = a;
		var n2 = b;		
		if (a < b) { 
			n1 = b;
			n2 = a;
		}
		
		var rem = mod(n1, n2);		
		var result = gcd(n2, rem);
		return result;		
	};
	
	var str1 = input("Enter value for A in GCD(A,B) :");
	var str2 = input("Enter value for B in GCD(A,B) :");
	var n1 = stringToNumber(str1);
	var n2 = stringToNumber(str2);
	var result = gcd(n1, n2);
	println(concat("GCD(", concat(n1, concat(", ", concat(n2, concat(") = ", result))))));
	
'
]

{ #category : #'sample programs' }
JbSamplePrograms class >> noFunctions [
	"self run: #noFunctions"
	
	^'var x = 1;
var y = 10 * x - 1;
if (y == 9) { 
   x = 16;
}
'
]

{ #category : #utilities }
JbSamplePrograms class >> run: method [
	"Look at sample programs for examples of using this method."

	^JbInterpreter new run: (self perform: method)
]

{ #category : #'sample programs' }
JbSamplePrograms class >> squareRootProgram [

	"Input a number from the user. Compute and print the square root of the number using Newton's method. Print each approximation step as well"

	^ '

	var getFloor = function (n) { 
		var rem = mod(n, 1);
		var d = n - rem;
		return d;
	};

	var getCeiling = function (n) {  
		var f = getFloor(n);
		var result = f + 1;
		return result;
	};

	var positivePower = function (n, p) { 
		var i = p;
		if (i == 0) { 
			return 1;
		}		
				
		var result = 1;		
		while (i > 0) { 
			result = result * n;
			i = i - 1;
		}
		
		return result;
	};

	var getFactorOfTen = function (n) { 
		var temp = n;
		var c = 0;
		var f = getFloor(temp);
		while (f >= 10) { 
			temp = temp / 10;
			f = getFloor(temp);
			c = c + 1;
		}
		
		return c;
	};

	var getPrecisionNumStr = function (v, p) { 
		var n = v;
		var f = getFloor(n);
		var str = concat("", f);
		var rem = v - f;
		var prec = 1 / p;

		if (rem >= prec) { 
			n = rem * p;
			f = getFloor(n);
			var d = f / p;
			str = concat(concat(str, " + "), d); 
		}
		
		return str;
	};

	var newtonsSqrtMethod = function (s, p) {
		var f10 = getFactorOfTen(s); 
		var n = getCeiling(f10 / 2);
		var p10 = positivePower(10, n); 
		var x = 6 * p10;
		var diff = abs((x * x) - s);
		var pass = diff <= (1 / p);
		var str = "";
		while (not(pass)) { 
			
			x = (1/2) * (x + (s/x));			
			
			str = getPrecisionNumStr(x, p);
			println(concat("X = ", str));
			
			diff = abs((x * x) - s);
			pass = diff <= (1 / p);
		}
	
		return x;	
	};

	var str = input("Enter a number to find its square root:");
	var val = stringToNumber(str);	
	var precision = 1000000;
	println(concat("Approximating square root of ", concat(str, concat(" with precision [1/", concat(precision, "]")))));
	var result = newtonsSqrtMethod(val, precision);
	var rStr = getPrecisionNumStr(result, precision);
	println(concat("Result = ", rStr));
	
	'
]
