#!/usr/racket/bin/racket
#lang racket

; |||||||||||||||||||||||||||||||||
; ||    __    sjomli.is    __    ||
; ||  _/  |_ __ __  _____ |__|   ||
; ||  \   __\  |  \/     \|  |   ||
; ||   |  | |  |  /  Y Y  \  |   ||
; ||   |__| |____/|__|_|__/__|   ||
; ||                             ||
; |||||||||||||||||||||||||||||||||

(define (atoi n)
    (define (inner i arr)
        (if (> i n)
            arr
            (inner (+ i 1) (cons i arr))
        )
    )
    (inner 1 '())
)

(define (foldr f x u)
    (if (null? x)
        u
        (f (car x) (foldr f (cdr x) u))
    )
)

(define (powlist n)
    (if (= n 0)
        '(())
        (append 
            (powlist (- n 1))
            (map (lambda (x) (cons n x))
                (powlist (- n 1))    
            )
        )
    )
)

(atoi 10)
(foldr (lambda (y z) (* y z)) `(1 2 3) 10)
(powlist 3)

; (- 1 10)
; (- 10 1)