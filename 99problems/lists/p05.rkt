;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname p05) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Problem 5
; 
; Reverse a list
;     Example:
;     * (reverseL '(a b c d))
;     (d c b a)
; 


;; List -> List

;; Given a list returns a list with all its elements reversed

(check-expect (reversel '(a b c d e f)) '(f e d c b a))
(check-expect (reversel '(a)) '(a))
(check-expect (reversel '()) '())

;(define (reversel xs) xs)

(define (reversel xs)
  (match xs
    ['() '()]
    [(cons h t) (append (reversel t) (cons h '()))]))

