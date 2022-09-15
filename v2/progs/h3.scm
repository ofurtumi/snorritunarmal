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

(define (product x)
        (define (multi acc l)
            (if (null? (cdr l))
                (* acc (car l))
                (multi (* acc (car l)) (cdr l)) 
            )
        )
    (if (null? x) 0 (multi 1 x))
)

(product (list 1 2 3))
(product '())