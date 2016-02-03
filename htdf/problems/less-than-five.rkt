;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname less-than-five) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; less-than-five-starter.rkt

; 
; PROBLEM:
; 
; DESIGN function that consumes a string and determines whether its length is
; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
; of the stub and template.
; 

;; String -> Boolean
;; If the string contains less than 5 charecters then produce True, false otherwise
;; including if the string contains 5 chars.

(check-expect (lessThanFive? "helloworld") false)
(check-expect (lessThanFive? "hell") true)
(check-expect (lessThanFive? "hello") false)
(check-expect (lessThanFive? "") true)

;(define (lessThanFive? str) false) ; stub

;(define (lessThanFive? str) ;template
;  (...str))

(define (lessThanFive? str)
  (< (string-length str) 5))