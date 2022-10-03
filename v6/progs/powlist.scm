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

(define (iota n)
    (define (helper i acc)
        (if (> i n)
            acc
            (helper (+ i 1) (cons i acc))        
        )
    )
    (helper 1 '())
)

(define (powerlist n)
    (define (helper i acc)
        (if (> i n)
            acc
            (helper (+ i 1) (cons (iota i) acc))
        )
    )
    (helper 0 '())
)

(powerlist 4)

