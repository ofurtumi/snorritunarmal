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

((sum3 5) 10)
((sum3 11) 10)