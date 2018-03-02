; Programming Languages: Section 5 - Mutation With set!

#lang racket

; Example
(define b 3)
(define f (lambda (x) (* 1 (+ x b))))
(define c (+ b 4)) ; 7
(set! b 5)
(define z (f 4))   ; 9
(define w c)       ; 7

; The way to avoid this is to make a local copy
(define bb 3)
(define ff
  (let ([bb bb])
    (lambda (x) (* 1 (+ x bb)))))