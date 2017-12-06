#lang sicp
;;(define (cuberoot x)
;;  (cuberoot-iter 1.0 x))

(define (cuberoot-iter old-guess x)
  (let ((new-guess (improve old-guess x)))
    (if (good-enough? old-guess new-guess)
        new-guess
        (cuberoot-iter new-guess x))))

(define (improve y x)
  (/ (+ y y (/ x (* y y)))
     3))

;; Stop when the difference is less than 1/1000th of the guess
(define (good-enough? old-guess new-guess)
  (<= (abs (- old-guess new-guess))
      (abs (* old-guess 0.001))))
;; should be abs(old-guess * 0.001) !!!

;; new-y = (x / y^2 + 2y) / 3

;; this fails for -2. when x = -2, y = 1. then new-y = 0, zero division!

;; Fix: take absolute cuberoot and return with sign!

(define (cuberoot x)
  ((if (< x 0) - +) (cuberoot-iter 1.0 (abs x))))

;; Testing
(cuberoot 1)
(cuberoot 0)
(cuberoot -8)
(cuberoot 27)
(cuberoot -1000)
(cuberoot 1e-30)
(cuberoot 1e60)

;; Additional test
(cuberoot -2)

;; If the x is critically large, program will fail due to the limitation of algorithm.