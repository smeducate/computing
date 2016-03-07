;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p04) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))

; Problem 4
; 
; Find the number of elements in the list.
;     Example:
;     * (elements '(a b c d))
;     4
; 


;; List -> Num

;; Given a list returns the number of elements in the list

(check-expect (elements '(a b c d)) 4)
(check-expect (elements '(a)) 1)
(check-expect (elements '()) 0)

;(define (elements xs) 2)

(define (elements xs)
  (match xs
    ['() 0]
    [(cons h t) (+ 1 (elements t))]))