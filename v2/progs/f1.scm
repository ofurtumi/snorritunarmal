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


;; notkun: (last x)
;; fyrir: x=(x1 x2 ... xN) sem er listi, má ekki vera tómur
;; gildi: xN, það er aftasta gildi x
(define (last x)
    (if (null? (cdr x))
        (car x)
        (last (cdr x))
    )
)

(last '(1 2 3))