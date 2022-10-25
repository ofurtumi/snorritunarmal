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

(atoi 10)
(atoi 0)
(cons 1 '(2 3))