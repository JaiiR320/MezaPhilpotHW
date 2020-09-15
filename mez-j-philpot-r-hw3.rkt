;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mez-j-philpot-r-hw3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;1).
;; volunteer-org is a (make-volunteer-org String String Natural Boolean Boolean Number Number alos)
; kind is a string (animal shelter, nursing home, soup kitchen, etc.)
; name is the name of volunteer organization
; age is minimum age requirement
; consent is either:
;  true- volunteer is under age of 18 and requires parental consent
;  false- volunteer does not need parental consent
; license is either:
;  true- volunteer has valid driver's license
;  false- volunteer does not have valid driver's license
; training is the required hours of training
; hours is the minimum number of hours volunteer must work per week
; languages is a list of languages spoken by clients of organization
(define-struct volunteer-org(kind name age consent license training hours languages))

;; ListOfStrings is one of:
; - empty
; - (cons String ListOfStrings)

(define ORG1(make-volunteer-org "animal shelter" "Barkmeow" 18 false false 10 14 (cons "Chalcatongo Mixtec"(cons "Arabic" empty))))
(define ORG2(make-volunteer-org "soup kitchen" "Expensive Soup" 16 true false 0 19 empty))
(define ORG3(make-volunteer-org "nursing home" "Old People Home" 2 false true 0 100 (cons "English"(cons "Pig Latin" (cons "Pig Latin 2.0" empty)))))
(define ORG4(make-volunteer-org "soup kitchen" "Cake only Soup Kitchen" 90 true false 24 72 (cons "English" empty)))
(define ORG5(make-volunteer-org "habitat conservation" "GEICO" 20 true true 999 10 (cons "German" (cons "Arabic" (cons "Pig Latin" empty)))))

;;2).
;; volunteer-org-fcn: a-volunteer-org -> ...
; (define (volunteer-org-fcn a-volunteer-org)
;  (... (volunteer-org-kind a-volunteer-org)
;       (volunteer-org-name a-volunteer-org)
;       (volunteer-org-age a-volunteer-org)
;       (volunteer-org-consent a-volunteer-org)
;       (volunteer-org-license a-volunteer-org)
;       (volunteer-org-training a-volunteer-org)
;       (volunteer-org-hours a-volunteer-org)
;       (volunteer-org-languages a-volunteer-org)))

;; fcn-for-los: los -> ...
; (define (fn-for-los los)
;  (cond [(empty? los) ...]
;        [else
;         (... (first los)
;              (fn-for-los (rest los)))]))

;;3).
;; ListOfVolunteerOrg is one of:
; empty
; (cons volunteer-org ListOfVolunteerOrg)

(Define ListOfVolunteerOrg1 (cons ORG1 (cons ORG2 (cons ORG3 empty))))
(Define ListOfVolunteerOrg2 (cons ORG3 (cons ORG4 (cons ORG5 empty))))
(Define ListOfVolunteerOrg3 (cons ORG1 (cons ORG5 empty)))

;;4).

;  (cond [(empty? ListOfVolunteerOrg) ...]
;        [else
;         (... (first los)
;              (fn-for-los (rest los)))]))

;; fcn-for-ListOfVolunteerOrg: ListOfVolunteerOrg -> ...
; (define (fn-for-ListOfVolunteerOrg ListOfVolunteerOrg)
;  (cond [(empty? ListOfVolunteerOrg) ...]
;        [(cons? ListOfVolunteerOrg) (...   (volunteer-org-fcn (first ListOfVolunteerOrg))
;                                           (fn-for-ListOfVolunteerOrg (rest ListOfVolunteerOrg))]))

