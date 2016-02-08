;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname city-name) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; city-name-starter.rkt

; 
; PROBLEM:
; 
; Imagine that you are designing a program that, among other things, 
; has information about the names of cities in its problem domain.
; 
; Design a data definition to represent the name of a city. 
;    


; INFORMATION      Data
; 
; Vancouver         "Vancouver"
; 
; Boston            "Boston"
; 
; 

; Cityname is string
; Interpretation name of the city
(define cn1 "Boston")
(define cn2 "Vancouver")
#;
(define (fn-for-city-name cn)
  (...cn))

;;Templates rules used
;; - Atomic non-distinct rule: String
;(define (best? cn) false) ; this is a stub

(check-expect (best? "Vancouver") false)
(check-expect (best? "Hogsmead") true)

;(define (best? cn)
;  (...cn))

;(define (best? cn)
;  (if (string=? cn "Hogsmead")
;       true
;       false))

;;Any expression of the form ( if (XXX true) false) can be reduced to XXX
(define (best? cn)
  (string=? cn "Hogsmead"))