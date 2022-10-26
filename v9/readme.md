<!-- ---
pdf_options:
    format: a4
    margin: 7mm 20mm
--- -->

# verkefnablað 9 - einstaklingsverkefni
> ath. allur kóði er í sama skjali við keyrslu, braut hann upp hér bara til að koma honum betur og fallegar fyrir


## hönnunarskjal fyrir complex.mmod
```java
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Design document
;;; =======================================
;;;
;;; Fastyrðing gagna: Tvinntala með gildið 
;;; x + iy, táknuð með listanum [x, y]
;;;
;;; =======================================
;;;
;;; Notkun:     z = createComp(x,y);
;;; Fyrir:      x og y eru rauntölur
;;; Eftir:      z er listi þar sem haus er 
;;;             raunpartur og hali er ímyndaði partur
;;;
;;; Notkun:     a = getReal(z);
;;; Fyrir:      z er tvinntala
;;; Eftir:      a er raunpartur z        
;;;
;;; Notkun:     b = getImag(z)
;;; Fyrir:      z er tvinntala
;;; Eftir:      b er ímyndaði partur z
;;;
;;; Notkun:     out = printImag(z);
;;; Fyrir:      z er tvinntala
;;; Eftir:      out er gildi strengur með gildum á 
;;;             haus og hala z á lesanlegu formi
;;;
;;; Notkun:     z = a +++ b;
;;; Fyrir:      a og b eru tvinntölur
;;; Eftir:      z er tvinntölusamlagning a og b
;;;
;;; Notkun:     z = a --- b;
;;; Fyrir:      a og b eru tvinntölur
;;; Eftir:      z er tvinntölufrádráttu a og b
;;;
;;; Notkun:     z = a *** b;
;;; Fyrir:      a og b eru tvinntölur
;;; Eftir:      z er tvinntölumargföldun a og b
;;;
;;; Notkun:     z = a /// b;
;;; Fyrir:      a og b eru tvinntölur
;;; Eftir:      z er tvinntöludeiling a og b
```

<div style='page-break-after: always;'></div>

## einingin complex.mmod
```java
"complex.mmod" =
!
{{
createComp = 
    fun(x, y)
    {
        return [x, y];
    };

getReal = 
   fun(z)
    {
        return head(z);
    };

getImag = 
    fun(z)
    {
        return head(tail(z));
    };

printImag =
   fun(z)
    {
        val out = "\n\treal: " ++ getReal(z) ++ "  \n\timag: " ++ getImag(z);
        return out;
    };

+++ = 
    fun(a, b)
    {
        return createComp(getReal(a) + getReal(b), getImag(a) + getImag(b));
    };

--- = 
    fun(a, b)
    {
        return createComp(getReal(a)-getReal(b),getImag(a)-getImag(b));
    };

*** = 
    fun(a, b)
    {
        return createComp(
            getReal(a)*getReal(b)-getImag(a)*getImag(b),
            getReal(a)*getImag(b)+getImag(a)*getReal(b)
        );
    };

/// = 
    fun(a, b)
    {
        val temp = getReal(b)*getReal(b)+getImag(b)*getImag(b);
        return createComp(
            (getReal(a)*getReal(b)+getImag(a)*getImag(b))/temp, 
            (getImag(a)*getReal(b)-getReal(a)*getImag(b))/temp
        );
    };
}};
```

## testforrit fyrir complex.mmod eininguna
```java
;;; Test forrit fyrir complex.mmod
"complex.mexe" = main in
{{
main =
	fun()
	{
		try
		{
			val c1 = createComp(10.0, 20.0);
            writeln("c1: \t   " ++ printImag(c1));

			val c2 = createComp(5.0, 9.0);
            writeln("c2: \t   " ++ printImag(c2));

            val temp1 = c1 +++ c2;
            writeln("c1 +++ c2: " ++ printImag(temp1));
            
            val temp2 = c1 --- c2;
            writeln("c1 --- c2: " ++ printImag(temp2));
            
            val temp3 = c1 *** c2;
            writeln("c1 *** c2: " ++ printImag(temp3));
            
            val temp4 = c1 /// c2;
            writeln("c1 /// c2: " ++ printImag(temp4));


		}
		catch(e)
		{
			printExceptionTrace(&e)
		}
	};
}}
*
"complex.mmod"
*
BASIS
;
```

<div style='page-break-after: always;'></div>

## útkoma úr þýðingu og keyrslu á complex.mexe

### copy paste
```bash
Reused 1745 out of 2449 operations, 704 operation objects used.
c1:        
        real: 10.0  
        imag: 20.0
c2:        
        real: 5.0  
        imag: 9.0
c1 +++ c2: 
        real: 15.0  
        imag: 29.0
c1 --- c2: 
        real: 5.0  
        imag: 11.0
c1 *** c2: 
        real: -130.0  
        imag: 190.0
c1 /// c2: 
        real: 2.169811320754717  
        imag: 0.09433962264150944
```

### skjáskot
![skjáskot af keyrslu](2022-10-26-17-23-02.png)