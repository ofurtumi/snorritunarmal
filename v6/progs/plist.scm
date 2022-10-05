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

(define (powerlist n )
    (if (= n 0)
        '(())
        (append (powerlist (- n 1))
            (map (lambda (x) (cons n x))
                (powerlist (- n 1))
            )
        )
    )
)

(powerlist 2)

; (append '(1 2) '(1 2 3))