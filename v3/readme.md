# verkefnablað 3 - einstaklingsverkefni

## 1.
```scheme
((lambda (x) (/ (+ x z) z)) 10)
```
* í þessu tilfelli setti í `z` sem 10 með `(define z 10)` og þá skilar segðin `2`
* í þessu dæmi er `z` frjáls breyta og `x` bundin breyta
* endurskrif með a og b:
  * λa. ((a + b) / z)
  * `((lambda (a) (/ (+ a b) b)) 10)`

## 2.
```scheme
((((lambda (x)
    (lambda (y) 
        (lambda (z) 
            (x (y (y z)))
        )
    )
    ) (lambda (a) (+ a 1))
    ) (lambda (b) (+ b 2))
    ) 10
)
```

* í þessu dæmi eru bundnu breyturnar `z = 10`, `y = λb. (b + 2)` og `x = λa. (a + 1)` og þá er útkoman `15`
* `λa. (λb. (λc. a (b (bc))))`