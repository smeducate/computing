;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname demolish) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; demolish-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are assigned to develop a system that will classify 
; buildings in downtown Vancouver based on how old they are. 
; According to city guidelines, there are three different classification levels:
; new, old, and heritage.
; 
; Design a data definition to represent these classification levels. 
; Call it BuildingStatus.
; 

;; BuildingStatus is one of:
;; - New
;; - Old
;; - heritage
;; interp
;; "new" means the building is new
;; "old" means that the build is old
;; "heritage" means that the building is a heritage building

(define BS-N "new")
(define BS-O "old")
(define BS-H "heritage")
#;
(define (fn-for-buildingstatus s)
  (cond[(string=? s "new") (...)]
       [(string=? s "old") (...)]
       [(string=? s "heritage") (...)]))

;;Template rules used:
;; - one of: 3 cases
;; - atomic distinct: "old", "new", "heritage"

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; The city wants to demolish all buildings classified as "old". 
; You are hired to design a function called demolish? 
; that determines whether a building should be torn down or not.
; 

;;BuildingStatus -> Boolean
;; takes a building status and returns true if it is classified as old, false otherwise

;;(define (demolish? bst) false) ;stub

(check-expect (demolish? "new") false)
(check-expect (demolish? "old") true)
(check-expect (demolish? "heritage") false)

;<use template from Buildingstatus>
(define (demolish? s)
  (cond[(string=? s BS-O) true]
       [(string=? s BS-N) false]
       [(string=? s BS-H) false]))

