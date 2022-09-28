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

(RealPowRecursive (+ 1 (expt 10 -10)) (RealPowRecursive 10 10))
(RealPowRecursive 10 4)
(RealPowRecursive 93 7)