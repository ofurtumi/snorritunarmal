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

(define (remove-last x)
    (if (null? (cdr x))
        '()
        (cons (car x) (remove-last (cdr x))) 
    )
)

(remove-last '(1 2 3 4 5)) 
; (cdr '(1))