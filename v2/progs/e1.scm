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

;; notkun: (sum x)
;; fyrir: x=(x1 x2 ... xN) er listi talna, getur verið tómur
;; gildi: talan x1+x2+...+xN, summa allra talna í listanum
(define (sum x)
    (if (null? x) 
        0 
        (+ (car x) (sum (cdr x))))    
)

(sum '(1 2 3 4 5))
(sum '())