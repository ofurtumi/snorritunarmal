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

(define (cross a b)
    (if (null? a)
        0
        ((map (lambda (y) (list (car a) y)) b)
        (cross (cdr a) b))
    )
)

(cross '(1 2 3 4 5) '(1 2 3 4 5))

; (map (lambda (y) (list 1 y))'(1 2 3 4 5))