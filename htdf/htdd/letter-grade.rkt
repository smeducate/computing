;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname letter-grade) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; letter-grade-starter.rkt

; 
; PROBLEM:
; 
; As part of designing a system to keep track of student grades, you
; are asked to design a data definition to represent the letter grade 
; in a course, which is one of A, B or C.
;   

;; LetterGrade is one of:
;;  - "A"
;;  - "B"
;;  - "C"

;; interp. the letter grade in a course
;; <examples are redundant for enumerations>
#;

(define (fn-for-letter-grade lg)
  (cond [(string=? "A" lg) (...)]
        [(string=? "B" lg) (...)]
        [(string=? "C" lg) (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct value: "A"
;;  - atomic distinct value: "B"
;;  - atomic distinct value: "C"