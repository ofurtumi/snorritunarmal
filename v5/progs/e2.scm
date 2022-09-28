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

;; Notkun: (transpose-list z)
;; Fyrir: z er listi jafnlangra lista,
;; z=((x11 x12 ... x1N)
;; (x21 x22 ... x2N)
;; (x31 x32 ... x3N)
;; .
;; .
;; .
;; (xM1 xM2 ... xMN))
;; Gildi: Listinn sem er byltingin
;; (transpose) af z, þ.e.
;; ((x11 x21 ... xM1)
;; (x12 x22 ... xM2)
;; (x13 x23 ... xM3)
;; .
;; .
;; .
;; (x1N x2N ... xMN)
;; )
(define (transpose-list z)
    
    ;; Notkun:  (head y)
    ;; Fyrir:   y er listi jafnlangra lista
    ;;          y = ((a11 a12 ... a1N)
    ;;               (a21 a22 ... a2N)
    ;;               .
    ;;               .
    ;;               .
    ;;               (aM1 aM2 ... aMN))
    ;;
    ;; Gildi:   listi af fyrstu stökum hvers og eins innri lista
    ;;          head af y, þ.e. '(a11 a21 ... aM1)
    (define (head y)
        (if (null? y)
            '()
            (cons (car (car y)) (head (cdr y)))
        )
    )

    ;; Notkun:  (rest x)
    ;; Fyrir:   x er listi jafnlangra lista
    ;;          x = ((b11 b12 ... b1N)
    ;;               (b21 b22 ... b2N)
    ;;               .
    ;;               .
    ;;               .
    ;;               (bM1 bM2 ... bMN))
    ;;
    ;; Gildi:   listi af cdr gildum innri lista
    ;;          rest af x, þ.e. 
    ;;          ((b12 b13 .. b1N)
    ;;           (b22 b23 .. b2N)
    ;;           .
    ;;           .
    ;;           .
    ;;           (bM2 bM3 .. bMN))
    (define (rest x)
        (if (null? x)
            '()
            (cons (cdr (car x)) (rest (cdr x)))
        )
    )
    
    (if (null? (car z))
        '()
        (cons (head z) (transpose-list (rest z)))
    )
)
(transpose-list '((1 2 3) (4 5 6) (7 8 9)))
(transpose-list '((9 8 7) (6 5 4) (3 2 1)))
(transpose-list '((9 8) (6 5)))

; (cons (head test) (cons (head (rest test)) (cons (head (rest (rest test))))))
; (cons (head (rest (rest test))) '())
; (cons '(1 4 7) (list '(2 5 8)))

; (null? (rest '((0) (1) (2))))

; (test2 test)
; (cdr (car test))


(rest '((1 2 3) (4 5 6) (7 8 9)))
(cons '(4 5 6) (cons '(1 2 3) '()))