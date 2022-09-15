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

;; notar lambda föll til þess að reikna út x+y
(((lambda (x) (lambda (y) (+ x y)))2) 3)

((lambda (x y) (+ x y)) 3 5)

(define (betterMulti x) 
    (arithmetic-shift x 5)
)