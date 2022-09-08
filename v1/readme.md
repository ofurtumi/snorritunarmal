# einstaklingsverkefni - v1

## 1.
B)
## 2. 
### a)
regluleg segð:  
```regex
(a*b*c*)*
```

stöðuvél:  
![stöðuvél fyrir 2a](imgs/e1-2a-SM.png)  

### b)
regluleg segð:  
```regex
c*b*a*
```

stöðuvél:  
![stöðuvél fyrir 2b](imgs/e1-2b-SM.svg)

### c)
þetta gengur ekki, málið er ekki reglulegt en í fljótu bragði virðist þetta vera svipað dæmi og í hópverkefni 1, þe.  
```bnf
<y> ::= "b" <y> "c" | ε
```  
en lykilatriðið hér er að `<y>` getur ekki farið út fyrir sitt scope og virkar þessvegna ólíkt þessu máli

### d)
regluleg segð:  
`a('+'a)*` eða `(a'+')*a`

stöðuvél:  
![stöðuvél fyrr 2d](imgs/e1-2d-SM.svg)

### e)
þetta mál er ekki reglulegt  

### f)
þetta mál er ekki reglulegt

## 3. 
regex: 
```
a*(ba*b)*a*
```
stöðuvél:  
![stöðuvél fyrir kvikindið](imgs/e1-3-SM.png)  

BNF:
``` BNF
<e> ::= a <e> | b <x> | ε
<x> ::= b <e> | a <x>
```

útleiðslutré:  
![útleiðslutré](imgs/e1-3-ST.png)


## 4.
BNF:  
```bnf
<e> ::= x | ( <e> ) | <e> + <e>
```

EBFN:
```bnf
e ::= x | ( e ) | e + e
```

málrit:  
![málrit fyrir málið](imgs/e1-4-RD.svg)