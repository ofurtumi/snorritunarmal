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

(define (sum1 n)
    (define (adder acc i)
        (if (<= i n)
            (adder (+ acc i) (+ i 1))
            acc
        )
    )
    (adder 0 0)
)

(sum1 0)
(sum1 10)