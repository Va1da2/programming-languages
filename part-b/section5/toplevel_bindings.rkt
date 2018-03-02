; Programming Langages: Section 5 - Top-Level Bindings

#lang racket

(provide (all-defined-out))

(define (f x) (+ x (* x b))) ; forward reference ok here
(define b 3)
(define c (+ b 4)) ; backward reference ok
;(define d (+ e 4)) ; not ok - will get an error
(define e 5)
;(define f 17) ; not ok: f already define in this module