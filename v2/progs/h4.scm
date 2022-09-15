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

(define (last x)
    (if (null? (cdr x))
       (car x)
       (last (cdr x)) 
    ) 
)

(define (myappend x y)
    (define (yourappend out l1 l2)
        (if (null? l2)
            (if (null? l1) 
                out
                (yourappend (cons (last l1) out) (remove-last l1) l2) 
            )
            (yourappend (cons (last l2) out) l1 (remove-last l2))
        )
    )
    (yourappend '() x y)
)

(myappend '(1 2 3) '(4 5 6))
halló ég heiti tumi, hvað heitir þú?
halló ég heiti tumi, hvað heitir þú?
