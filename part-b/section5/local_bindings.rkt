; Programming Languages: Section 5 - Local Bindings

#lang racket

(provide (all-defined-out))

; let expression
(define (max-of-list xs)
  (cond [(null? xs) (error "max-of-list given empty list")]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-of-list (cdr xs))])
              (if (> tlans (car xs))
                  tlans
                  (car xs)))]))

; let* expression
(define (silly-double x)
  (let* ([x (+ x 3)]
         [y (+ x 2)])
    (+ x y -8)))

; letrec expression
(define (silly-triple x)
  (letrec ([y (+ x 2)]
           [f (lambda(z) (+ x y w x))]
           [w (+ x 7)])
    (f -9)))

; another letrec example
(define (silly-mod x)
  (letrec
      ([even? (lambda(x) (if (zero? x) #t (odd? (- x 1))))]
       [odd? (lambda(x) (if (zero? x) #f (even? (- x 1))))])
    (if (even? x) 0 1)))

; define example (same semantics as letrec)
(define (silly-mod2 x)
  (define (even? x) (if (zero? x) #t (odd? (- x 1))))
  (define (odd? x) (if (zero? x) #f (even? (- x 1))))
  (if (even? x) 0 1))