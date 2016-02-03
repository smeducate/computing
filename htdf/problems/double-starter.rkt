;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname double-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; double-starter.rkt

; 
; PROBLEM:
; 
; Design a function that consumes a number and produces twice that number. 
; Call your function double. Follow the HtDF recipe and leave behind commented 
; out versions of the stub and template.
; 

;; Number -> Number

;; Produces 2 times the given number

(check-expect (double 0) (* 0 2))
(check-expect (double 1) (* 1 2))
(check-expect (double 3) (* 3 2))

;(define (double b) 0) ; this is the stub


;; (double 0) should produce 0
;; (double 1) should produce 2
;; (double 2) should produce 4

(define (double n)
  (* n 2))