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

;; notkun:  ((incall y) x)
;; fyrir:   y er tala,
;;          x=(x1 x2 ... xN) er listi talna, ekki tómur
;; gildi:   talnalistinn (x1+y x2+y ... xN+y)
(define (incall y)
    ;; notkun:  (incall y)
    ;; fyrir:   y er tala,
    ;; gildi:   fallið inner með töluna y sem breytu
    (define (inner x)
        (if (null? (cdr x))
            (list (+ y (car x)))
            (cons (+ y (car x)) (inner (cdr x)))
        )
    )

    inner
)

((incall 2) '(1 2 3))