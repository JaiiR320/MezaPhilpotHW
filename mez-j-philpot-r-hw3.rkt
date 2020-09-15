;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname philpot-r-hw3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;1).
;; volunteer-org is a (make-volunteer-org String String Natural Boolean Boolean Number Number alos)
(define-struct volunteer-org(kind name age consent license training hours languages))

(define org1(make-volunteer-org "animal shelter" "We put them out of their misery" 18 false false 10 14 (cons "German"(cons "English" empty))))
(define org2(make-volunteer-org "soup kitchen" "soup kitchen but the foods expensive" 16 true false 0 19 empty))
(define org3(make-volunteer-org "nursing home" "U bout to die sir" 2 false true 0 100 (cons "English"(cons "Hibluwiek Astuvince" (cons "Every other language" empty)))))
