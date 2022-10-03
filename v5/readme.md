# verkefnablað 5 - einstaklingsverkefni

## 1.
hérna er kóðinn:  
```scheme
; Notkun:   (RealPowerRecursive x y)
; Fyrir:    x er jákvæð rauntala > 0
;           y er heiltala > 0
; Gildi:    rauntalan x^y
(define (RealPowRecursive x y)
    (if (= y 0)
        1.0
        (if (= (remainder y 2) 0)
            (* 1.0 (RealPowRecursive (* 1.0 x x) (quotient y 2)))
            (* 1.0 x (RealPowRecursive (* 1.0 x x) (quotient (- y 1) 2)))
        )
    )
)
```

hér koma nokkrar keyrslur:  
```scheme
(RealPowRecursive (+ 1 (expt 10 -10)) (RealPowRecursive 10 10))
(RealPowRecursive 10 4)
(RealPowRecursive 93 7)
```

og útkomur úr þeim:  
```
2.7182820434752477
10000.0
60170087060757.0
```

## 2.
í þessu verkefni tók ég mér góðann tíma að útbúa það, ég fann góðann oneliner á 
[stackoverflow](https://stackoverflow.com/questions/30775032/transpose-a-matrix-in-racket-list-of-lists#answers) 
og hugsaði að ég myndi nota `map` og `apply` fyrir fallið mitt, en svo ákvað ég að það væri ekki fyrir mig og útfærði þetta án þess að nota þau

<div style='page-break-after: always;'></div>

hérna er kóðinn í allri sinni dýrð:  
```scheme
;; Notkun: (transpose-list z)
;; Fyrir: z er listi jafnlangra lista,
;; z=((x11 x12 ... x1N)
;; (x21 x22 ... x2N)
;; (x31 x32 ... x3N)
;; .
;; .
;; .
;; (xM1 xM2 ... xMN))
;; Gildi: Listinn sem er byltingin
;; (transpose) af z, þ.e.
;; ((x11 x21 ... xM1)
;;  (x12 x22 ... xM2)
;;  (x13 x23 ... xM3)
;;  .
;;  .
;;  .
;;  (x1N x2N ... xMN))
(define (transpose-list z)
    ;; Notkun:  (head y)
    ;; Fyrir:   y er listi jafnlangra lista
    ;;          y = ((a11 a12 ... a1N)
    ;;               (a21 a22 ... a2N)
    ;;               .
    ;;               .
    ;;               .
    ;;               (aM1 aM2 ... aMN))
    ;;
    ;; Gildi:   listi af fyrstu stökum hvers og eins innri lista
    ;;          head af y, þ.e. '(a11 a21 ... aM1)
    (define (head y)
        (if (null? y)
            '()
            (cons (car (car y)) (head (cdr y)))
        )
    )
```

<div style='page-break-after: always;'></div>

```scheme
    ;; Notkun:  (rest x)
    ;; Fyrir:   x er listi jafnlangra lista
    ;;          x = ((b11 b12 ... b1N)
    ;;               (b21 b22 ... b2N)
    ;;               .
    ;;               .
    ;;               .
    ;;               (bM1 bM2 ... bMN))
    ;;
    ;; Gildi:   listi af cdr gildum innri lista
    ;;          rest af x, þ.e. 
    ;;          '((b12 b13 .. b1N)
    ;;          '((b22 b23 .. b2N)
    ;;          .
    ;;          .
    ;;          .
    ;;          '((bM2 bM3 .. bMN)
    ;;)
    (define (rest x)
        (if (null? x)
            '()
            (cons (cdr (car x)) (rest (cdr x)))
        )
    )
    
    (if (null? (car z))
        '()
        (cons (head z) (transpose-list (rest z)))
    )
)
```

hér koma nokkrar keyrslur:   
```scheme
(transpose-list '((1 2 3) (4 5 6) (7 8 9)))
(transpose-list '((9 8 7) (6 5 4) (3 2 1)))
(transpose-list '((9 8) (6 5)))
```

og útkoman úr þeim:  
```
'((1 4 7) (2 5 8) (3 6 9))
'((9 6 3) (8 5 2) (7 4 1))
'((9 6) (8 5))
```
