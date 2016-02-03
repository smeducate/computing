;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ensure-question) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; ensure-question-starter.rkt


; 
; PROBLEM:
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes a string, and adds "?" 
; to the end unless the string already ends in "?".
; 
; For this question, assume the string has length > 0. Follow the HtDF recipe and leave behind commented 
; out versions of the stub and template.
; 

;;String ->  String ;Signature
;; Takes a non-empty string and appends a "?" to the string only if the string does not end with a "?"

(check-expect (ensure-question "hello") "hello?")
(check-expect (ensure-question "hello?") "hello?")
(check-expect (ensure-question "") "?") ;undefined in the program spec

;;(define (ensure-question s) "s?") ;stub

;(define (ensure-question s) ;template
;   (...str))

(define (ensure-question str)
  (cond [(= (string-length str) 0) "?"]
        [(string=? (substring str (- (string-length str) 1)) "?") str]
        [else (string-append str "?")]))
