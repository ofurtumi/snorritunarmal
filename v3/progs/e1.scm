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

(define z 10)
((lambda (x) (/ (+ x z) z)) 10)


((((lambda (x)
    (lambda (y) 
        (lambda (z) 
            (x (y (y z)))
        )
    )
    ) (lambda (a) (+ a 1))
    ) (lambda (b) (+ b 2))
    ) 10
)
