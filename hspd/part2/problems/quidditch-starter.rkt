;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname quidditch-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; quidditch-starter.rkt
; 
; PROBLEM:
; 
; Imagine that you are designing a program that will keep track of
; your favorite Quidditch teams. (http://www.internationalquidditch.org/).
; 
; Design a data definition to represent a list of Quidditch teams. 
;
; Information
; UBC
; McGill
; Team Who must not be named
;  
; Data:
; "UBC"
; "McGill"
; "Team who must not be named."
; 
; empty
; 
; (cons "UBC"
;       (cons "Mcgill"
;             empty))
; 

;; ListOfString is one of
;; -empty
;; - (cons String ListOfString)

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
          (... (first los)       ;String
               (fn-for-los(rest los)))]))    ;LisOfString


;; Template rule used
;; - one of 2 cases
;; - atomic distinct empty
;; - compound: 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROBLEM:
; 
; We want to know whether your list of favorite Quidditch teams includes
; UBC! Design a function that consumes ListOfString and produces true if 
; the list includes "UBC".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; String, ListofString -> Boolean
;; Produce true if los contains "UBC"
(check-expect (contains-my-team? "UBC" empty) false)
(check-expect (contains-my-team? "UBC" (cons "UBC" empty)) true)
(check-expect (contains-my-team? "UBC" (cons "McGill" (cons "UBC" empty))) true)

;Stub definition of contains function
;(define (contains-my-team? t los) false) ;stub

(define (contains-my-team? t los)
  (cond [(empty? los) false]
        [else
         (if (string=? t (first los))
             true
             (contains-my-team? t (rest los)))]))    ;ListOfString
