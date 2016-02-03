;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname cond-expr) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #t () #f)))
;  General essence - Rules for function calls, if and cond expressions all work
;  by trying to reduce program to a simpler program that does not have that construct
;   - function call is replaced with body
;   - if is replaced with true or false question
;   - cond is replaced with one answer
; 


; if there are no question/answer pairs signal error. In this case we have question/ans pairs
; so proceed to the next eval rule
(cond [(> 1 2) "bigger"]
      [(= 1 2) "equal"]
      [(< 1 2) "smaller"])

;if the first question is true or value then replace the entire cond expression with the first answer.
;if the first question is not a value then evaluate it and replace it with its value.
; in this case the first question evaluates to false hence the question is replaced by false
(cond [false "bigger"]
      [(= 1 2) "equal"]
      [(< 1 2) "smaller"])

;if the first question is false then drop the entire question/ans pair from the cond expression
;therefore the above cond expression reduces to the one below.
(cond [(= 1 2) "equal"]
      [(< 1 2) "smaller"])

; Now we re-apply the rules to the newly formed cond expression
(cond [false "equal"]
      [(< 1 2) "smaller"])

;dropped the false uestion/answer pair
(cond [(< 1 2) "smaller"])

(cond [true "smaller"])

"smaller"




