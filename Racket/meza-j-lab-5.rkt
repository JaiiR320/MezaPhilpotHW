;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname meza-j-lab-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Jair Meza
;; jdmeza

;;1)
(define-struct river (name pH DO lor))
;; River is a (make-river String Number Number ListOfRiver)
;; Represents a river where
;; name is the name of the river
;; pH is the acidity of the river, [0,14]
;; DO is the DO in parts per millino
;; lor is a ListOfRiver, or rivers that feed into the parent river
;; a ListOfRiver is either
;;  - empty
;;  - (cons (make-river name pH DO lot) ListOfRiver)

;;2)
;; example river system
(define MCCOYRIVER (make-river "Rice River" 8 6
                 (list (make-river "Henry River" 7 3 empty)
                       (make-river "Baker River" 9 8
                       (list (make-river "Arnold River" 3 1)
                             (make-river "Grant River" 9 4)))
                       (make-river "Miller River" 7 6 empty))))

;;3)
;; Template for river
;#
(define (river-fcn a-river)
  (... (river-name a-river)
       (river-pH)
       (river-DO)
       (list-of-river-fcn (river-lot))))


;; Template for ListOfRiver
;#
(define (list-of-river-fcn a-lor)
  (cond [(empty? a-list) ...]
        [else
         (... (river-fcn (first a-lor)))
         ((list-of-river-fcn (rest a-lor)))]))
















