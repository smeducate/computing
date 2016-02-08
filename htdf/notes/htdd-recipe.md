#HOW TO DESIGN DATA (HTDD)

Data definitions are a driving element in the design recipes.

A data definition establishes the represent/interpret relationship between information and data:

- Information in the program's domain is represented by data in the program.
- Data in the program can be interpreted as information in the program's domain.

A data definition must describe how to form (or make) data that satisfies the data definition and also how to tell whether a data value satisfies the data definition. It must also describe how to represent information in the program's domain as data and interpret a data value as information.

So, for example, one data definition might say that numbers are used to represent the Speed of a ball. Another data definition might say that numbers are used to represent the Height of an airplane. So given a number like 6, we need a data definition to tell us how to interpret it: is it a Speed, or a Height or something else entirely. Without a data definition, the 6 could mean anything.

The first step of the recipe is to identify the inherent structure of the information.

Once that is done, a data definition consists of four or five elements:

1. A possible <b>structure definition</b> (not until compound data)
2. A <b>type comment</b> that defines a new type name and describes how to form data of that type.
3. An <b>interpretation</b> that describes the correspondence between information and data.
4. One or more <b>examples</b> of the data.
5. A <b>template</b> for a 1 argument function operating on data of this type.

#### What is the Inherent Structure of the Information?

One of the most important points in the course is that:

- the structure of the information in the program's domain determines the kind of data definition used,
- which in turn determines the structure of the templates and helps determine the function examples (check-expects),
- and therefore the structure of much of the final program design.

The remainder of this page lists in detail different kinds of data definition that are used to represent information with different structures. The page also shows in detail how to design a data definition of each kind. This summary table provides a quick reference to which kind of data definition to use for different information structures.

| When the form of the information to be represented... | Use a data definition of this kind |
| --- | --- |
| is atomic | Simple Atomic Data|
| is numbers within a certain range | Interval|
| consists of a fixed number of distinct items | Enumeration|
| is comprised of 2 or more subclasses, at least one of which is not a distinct item | Itemization|
| consists of two or more items that naturally belong together | Compound Data|
| is naturally composed of different parts | References to other defined type|
| is of arbitrary (unknown) size | self-referential or mutually referential|

#### Simple Atomic Data

Use simple atomic data when the information to be represented is itself atomic in form, such as the elapsed time since the start of the animation, the x coordinate of a car or the name of a cat.

```racket
;; Time is Natural
;; interp. number of clock ticks since start of game

(define START-TIME 0)
(define OLD-TIME 1000)

#;
(define (fn-for-time t)
  (... t))

;; Template rules used:
;;  - atomic non-distinct: Natural
```
##### Forming the Template
As noted below the template, it is formed according to the Data Driven Templates recipe using the right hand column of the atomic non-distinct rule.

##### Guidance on Data Examples and Function Example/Tests

One or two data examples are usually sufficient for simple atomic data.

When creating example/tests for a specific function operating on simple atomic data at least one test case will be required. Additional tests are required if there are multiple cases involved. If the function produces Boolean there needs to be at least a true and false test case. Also be on the lookout for cases where a number of some form is an interval in disguise, for example given a type comment like Countdown is Natural, in some functions 0 is likely to be a special case.

#### Intervals

Use an interval when the information to be represented is numbers within a certain range. Integer[0, 10] is all the integers from 0 to 10 inclusive; Number[0, 10) is all the numbers from 0 inclusive to 10 exclusive. (The notation is that [ and ] mean that the end of the interval includes the end point; ( and ) mean that the end of the interval does not include the end point.)

Intervals often appear in itemizations, but can also appear alone, as in:
```racket
;; Countdown is Integer[0, 10]
;; interp. the number of seconds remaining to liftoff
(define C1 10)  ; start
(define C2 5)   ; middle
(define C3 0)   ; end
 
#;
(define (fn-for-countdown cd)
  (... cd))

;; Template rules used:
;;  - atomic non-distinct: Integer[0, 10]
```

##### Forming the Template

As noted below the template, it is formed according to the Data Driven Templates recipe using the right hand column of the atomic non-distinct rule.

##### Guidance on Data Examples and Function Example/Tests

For data examples provide sufficient examples to illustrate how the type represents information. The three data examples above are probably more than is needed in that case.

When writing tests for functions operating on intervals be sure to test closed boundaries as well as midpoints. As always, be sure to include enough tests to check all other points of variance in behaviour across the interval.

#### Enumerations

Use an enumeration when the information to be represented consists of a fixed number of distinct items, such as colors, letter grades etc. The data used for an enumeration could in principle be anything - strings, integers, images even. But we always use strings. In the case of enumerations it is sometimes redundant to provide an interpretation and nearly always redundant to provide examples. The example below includes the interpretation but not the examples.

```racket
;; LightState is one of:
;;  - "red"
;;  - "yellow"
;;  - "green"
;; interp. the color of a traffic light

;; <examples are redundant for enumerations>
 
#;
(define (fn-for-light-state ls)
  (cond [(string=? "red" ls) (...)]
        [(string=? "yellow" ls) (...)]
        [(string=? "green" ls) (...)]))
;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"
```

##### Forming the Template

As noted below the template, it is formed according to the Data Driven Templates recipe as follows:

First, LightState is an enumeration with 3 cases, so the one of rule says to use a cond with 3 cases:

```racket
(define (fn-for-tlcolor ls)
  (cond [Q1 A1]
        [Q2 A2]
        [Q3 A3])) 
```

In the first clause, "red" is a distinct atomic value, so the cond question column of the atomic distinct rule says Q1 should be (string=? ls "red"). The cond answer column says A1 should be (...). So we have:

```racket
(define (fn-for-light-state ls)
  (cond [(string=? "red" ls) (...)]
        [Q2 A2]
        [Q3 A3])) 
```

Then "yellow" and "green" are also distinct atomic values, so the final template is:

```racket
(define (fn-for-light-state ls) 
  (cond [(string=? "red" ls) (...)]
        [(string=? "yellow" ls) (...)]
        [(string=? "green" ls) (...)]))
```

Guidance on Data Examples and Function Example/Tests

Data examples are redundant for enumerations.

Functions operating on enumerations should have (at least) as many tests as there are cases in the enumeration.

#### Large Enumerations

Some enumerations contain a large number of elements. A canonical example is KeyEvent, which is provided as part of big-bang. KeyEvent includes all the letters of the alphabet as well as other keys you can press on the keyboard. It is not necessary to write out all the cases for such a data definition. Instead write one or two, as well as a comment saying what the others are, where they are defined etc.

Defer writing templates for such large enumerations until a template is needed for a specific function. At that point include the specific cases that function cares about. Be sure to include an else clause in the template to handle the other cases. As an example, some functions operating on KeyEvent may only care about the space key and just ignore all other keys, the following would be an appropriate template for such functions.

```racket
#;
(define (fn-for-key-event kevt)
  (cond [(key=? " " kevt) (...)]
        [else
         (...)]))
;; Template formed using the large enumeration special case
```

The same is true of writing tests for functions operating on large enumerations. All the specially handled cases must be tested, in addition one more test is required to check the else clause.

