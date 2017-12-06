#lang sicp
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (sqrt x) (sqrt-iter 1.0 x))

;; using new-if will cause over-stack
;; new-if will execute both branch without regarding to predicate
;; because of the applicative-order in the **definition** of new-if
;; when we call the new-if, else-clause with be executed, and passed to cond

(if #t (display "good") (display "bad"))
(new-if #t (display "good") (display "bad"))
(display "\n")
(cond (#t (display "good"))
      (else (display "bad")))