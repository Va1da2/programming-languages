; Programming Languages: Section 5 - Parentheses Matter!

#lang racket

(provide (all-defined-out))

; [first big difference from ML (and Java)] PARENS MATTER!!
(define (fact n) (if (= n 0) 1 (* n (fact (- n 1)))))

; parens on the integer
(define (fact1 n) (if (= n 0) (1) (* n (fact1 (- n 1)))))

; calling different functions - this will work for all n except 0
(define (fact1b n) (if (= n 0) (1) (* n (fact (- n 1)))))

; try to leave out parens and DrRacket will notice
;(define (fact2 n) (if = n 0 1 (* n (fact2 (- n 1)))))

; identifier only accepts 1 expression (one parens)
;(define fact3 (n) (if (= n 0) 1 (* n (fact3 (- n 1)))))

; missing parens makes `*` to be called with procedure instead of int
(define (fact4 n) (if (= n 0) 1 (* n fact4 (- n 1))))

; putting function in parens by itself (when it expects arguments) doesnt work
(define (fact5 n) (if (= n 0) 1 (* n ((fact5) (- n 1)))))

; mistake place for the function
(define (fact6 n) (if (= n 0) 1 (n * (fact6 (- n 1)))))