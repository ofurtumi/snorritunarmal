# verkefnablað 4 - einstaklingsverkefni

## 1. 

```scheme
(define (sum1 n)
    (define (adder acc i)
        (if (<= i n)
            (adder (+ acc i) (+ i 1))
            acc
        )
    )
    (adder 0 0)
)
```

## 2.
```scheme
(define (sum2 i n)
    (define (adder acc j)
        (if (> i n) 
            0
            (if (<= j n)
                (adder (+ acc j) (+ j 1))
                acc
            )
        )
    )
    (adder 0 i)
)
```

## 3.
```scheme
(define ((sum3 i) n)
    (define (adder acc j)
        (if (> i n) 
            0
            (if (<= j n)
                (adder (+ acc j) (+ j 1))
                acc
            )
        )
    )
    (adder 0 i)
)
```

## 4.
```scheme
;; Notkun:  (reviota n)
;; Fyrir:   n er heiltala stærri eða jöfn og 0, n >= 0
;; Gildi:   listi af með stökum (n (n-1) ... 2 1), 
;;          skilar tóma lista ef n er 0
(define (reviota n)
    ;; Notkun:  (inner arr i)
    ;; Fyrir:   arr, listi af heiltölum í minnkandi röð
    ;;          i, heiltala stærri en 1, i > 1
    (define (inner arr i)
        (if (= i n)
            (cons i arr)
            (inner (cons i arr) (+ i 1))
        )
    )
    (if (= n 0)
        '()
        (inner '() 1)
    )
)
```