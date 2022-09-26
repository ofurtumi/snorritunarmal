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
(reviota 10)
(reviota 0)