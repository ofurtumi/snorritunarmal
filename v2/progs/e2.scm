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

;; notkun: (squaresum x)
;; fyrir: x=(x1 x2 ... xN) sem er listi talna, getur verið tómur
;; gildi: talan x1*x1+x2*x2+...+xN*xN
(define (squaresum x)
    ;; notkun: (helper acc arr)
    ;; fyrir:   acc er tala, 
    ;;          arr=(x1 x2 ... xN)
    ;; gildi: talan x1*x1+x2*x2+...+xN*xN
    (define (helper acc arr)
        (if (null? arr) acc
            (helper 
                (+ acc (* (car arr) (car arr)))
                (cdr arr)
            )
        )
    )
    ;; stofn fallsins squaresum:
    (helper 0 x)
)

(squaresum (list 1 2 3))
(squaresum '())