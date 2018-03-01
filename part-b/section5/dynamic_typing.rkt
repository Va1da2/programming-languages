; Programming Languages: Section 5 - Dynamic Typing

#lang racket

(provide (all-defined-out))

; [second big difference from ML (and Java)] Dynamic Typing!!

; dynamic typing: can use values of any type anywhere
;  e.g. a list that holds numbers or ther lists -- with
;   either lists or numbers nested arbitrarily deeply

(define xs (list 4 5 6))
(define ys (list (list 4 (list 5 0)) 6 7 (list 8) 9 2 3 (list 0 1)))

; version that expects all arguments being correct
(define (sum1 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))
          (+ (sum1 (car xs)) (sum1 (cdr xs))))))

; version to skip non-numbers and return sum
(define (sum2 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum2 (cdr xs)))
          (if (list? (car xs))
              (+ (sum2 (car xs)) (sum2 (cdr xs)))
              (sum2 (cdr xs))))))