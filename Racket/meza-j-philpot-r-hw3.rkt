;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname meza-j-philpot-r-hw3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Jair Meza
;jdmeza
;Robert Philpot
;rphilpot


;;1).
;; volunteer-org is a (make-volunteer-org String String Natural Boolean Boolean Number Number alos)
; kind is a string (animal shelter, nursing home, soup kitchen, etc.)
; name is the name of volunteer organization
; age is minimum age requirement
; consent is either:
;  true - volunteer is under age of 18 and requires parental consent
;  false - volunteer does not need parental consent
; license is either:
;  true - volunteer has valid driver's license
;  false - volunteer does not have valid driver's license
; training is the required hours of training
; hours is the minimum number of hours volunteer must work per week
; languages is a list of languages spoken by clients of organization
(define-struct volunteer-org(kind name age consent license training hours languages))

;; ListOfStrings is one of:
; - empty
; - (cons String ListOfStrings)

(define ORG1(make-volunteer-org "animal shelter" "Barkmeow" 18 false false 10 14 (cons "Chalcatongo Mixtec"(cons "Spanish" empty))))
(define ORG2(make-volunteer-org "soup kitchen" "Expensive Soup" 16 true false 0 19 empty))
(define ORG3(make-volunteer-org "nursing home" "Old People Home" 2 false true 0 100 (cons "English"(cons "Pig Latin" (cons "Pig Latin 2.0" empty)))))
(define ORG4(make-volunteer-org "soup kitchen" "Cake only Soup Kitchen" 90 true false 24 72 (cons "Spanish" empty)))
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

(define ListOfVolunteerOrg1 (cons ORG1 (cons ORG2 (cons ORG3 empty))))
(define ListOfVolunteerOrg2 (cons ORG3 (cons ORG4 (cons ORG5 empty))))
(define ListOfVolunteerOrg3 (cons ORG1 (cons ORG5 empty)))

;;4).

;; fcn-for-ListOfVolunteerOrg: ListOfVolunteerOrg -> ...
; (define (fn-for-ListOfVolunteerOrg ListOfVolunteerOrg)
;  (cond [(empty? ListOfVolunteerOrg) ...]
;        [(cons? ListOfVolunteerOrg) (...   (volunteer-org-fcn (first ListOfVolunteerOrg))
;                                           (fn-for-ListOfVolunteerOrg (rest ListOfVolunteerOrg))]))

;;5).
;; Constant defined as youngest age in highschool and also minimum age required for highschool student to be a volunteer
(define MINIMUM-AGE 13)

;; Helper fcn
;;hs-eligible: a-volunteer-org -> Natural
;;consumes a volunteer organization and produces 1 if minimum age requirement less than or equal to 13 and 0 if minimum age requirement greater than 13
(define (hs-eligible a-volunteer-org)
  (if (<= (volunteer-org-age a-volunteer-org) MINIMUM-AGE) 1 0))

(check-expect (hs-eligible ORG1) 0)
(check-expect (hs-eligible ORG2) 0)
(check-expect (hs-eligible ORG3) 1)
(check-expect (hs-eligible ORG4) 0)
(check-expect (hs-eligible ORG5) 0)
;;count-hs-eligible: a-ListOfVolunteerOrg -> Natural
;;consumes a list of volunteer organizations and produces the count of orgs that have a minimum age requirement lower than 13
(define (count-hs-eligible a-ListOfVolunteerOrg)
  (cond
    [(empty? a-ListOfVolunteerOrg) 0]
    [else
     (+ (hs-eligible (first a-ListOfVolunteerOrg)) (count-hs-eligible (rest a-ListOfVolunteerOrg)))]))

(check-expect (count-hs-eligible ListOfVolunteerOrg1) 1)
(check-expect (count-hs-eligible ListOfVolunteerOrg2) 1)
(check-expect (count-hs-eligible ListOfVolunteerOrg3) 0)
(check-expect (count-hs-eligible (append ListOfVolunteerOrg1 ListOfVolunteerOrg1 ListOfVolunteerOrg2)) 3)

;;6).

;;list-license-training: ListOfVolunteerOrg Natural -> ListOfVolunteerOrg
;;consumes a ListOfVolunteerOrg and a Natural and produces a a ListOfVolunteerOrg that
;;only has VolunteerOrgs that require a license and have fewer than the given hourly requirements

(check-expect (list-license-training ListOfVolunteerOrg1 5) (cons (make-volunteer-org "nursing home" "Old People Home" 2 #false #true 0 100 (cons "English" (cons "Pig Latin" (cons "Pig Latin 2.0" '())))) '()))
(check-expect (list-license-training ListOfVolunteerOrg2 1000) (cons
 (make-volunteer-org "nursing home" "Old People Home" 2 #false #true 0 100 (cons "English" (cons "Pig Latin" (cons "Pig Latin 2.0" '()))))
 (cons (make-volunteer-org "habitat conservation" "GEICO" 20 #true #true 999 10 (cons "German" (cons "Arabic" (cons "Pig Latin" '())))) '())))

;;helper fnc
;;license-and-max-hrs: a-lovo max-hours -> boolean
;;consumes a list of volunteer orgs and max hours and produces true if volunteer has license and max hours is greater than volunteer orgs training hours and false otherwise
(define (license-and-max-hrs a-lovo max-hours)
  (if (and (volunteer-org-license (first a-lovo)) (> max-hours (volunteer-org-training (first a-lovo))))
      true
      false))
(check-expect (license-and-max-hrs ListOfVolunteerOrg1 100) false)
(check-expect (license-and-max-hrs ListOfVolunteerOrg2 50) true)
;; list-license-training: a-lovo max-hours -> ListOfVolunteerOrgs
;;consumes a list of volunteer orgs and max hours and produces a list of volunteer orgs that require volunteers to be licensed and require fewer than the given number of training hours.
(define (list-license-training a-lovo max-hours)
  (cond [(empty? a-lovo) empty]
        [else (if (license-and-max-hrs a-lovo max-hours)
                  (cons (first a-lovo) (list-license-training (rest a-lovo) max-hours))
                  (list-license-training (rest a-lovo) max-hours))]))

;;7).
;;Languages-spoken: a-ListOfVolunteerOrg -> a-ListOfLanguages
;;consumes a List of Volunteer-org, and produces a list of each language from the orgs, with repeats

(check-expect (languages-spoken ListOfVolunteerOrg1) (cons "Chalcatongo Mixtec" (cons "Spanish" (cons "English" (cons "Pig Latin" (cons "Pig Latin 2.0" '()))))))
(check-expect (languages-spoken ListOfVolunteerOrg2) (cons "English" (cons "Pig Latin" (cons "Pig Latin 2.0" (cons "Spanish" (cons "German" (cons "Arabic" (cons "Pig Latin" '()))))))))

(define (languages-spoken a-lovo)
  (cond [(empty? a-lovo) empty]
        [else (append (volunteer-org-languages (first a-lovo)) (languages-spoken (rest a-lovo)))]))

;;8).
;;need-spanish-speakers: a-ListOfVolunteerOrgs -> a-ListOfVolunteerOrgs
;;consumes a list of volunteer-orgs and produces a list of volunteer-orgs 

;;helper-fcn
(check-expect (need-spanish-speakers ListOfVolunteerOrg1) (cons ORG1 empty))
(check-expect (need-spanish-speakers ListOfVolunteerOrg2) (cons ORG4 empty))

;;contains-string: a-list word -> boolean
;;consumes a list of volunteer org languages and a word and produces true if list contains the word and false otherwise
(define (contains-string a-list word)
  (cond [(empty? a-list) false]
        [else (if (string=? word (first a-list))
             true
             (contains-string (rest a-list) word))]))

(check-expect (contains-string (volunteer-org-languages (first ListOfVolunteerOrg1)) "Spanish") true)
(check-expect (contains-string (volunteer-org-languages (first ListOfVolunteerOrg2)) "English") true)
(check-expect (contains-string (volunteer-org-languages (first ListOfVolunteerOrg2)) "German") false)
(define SPANISH "Spanish")

(define (need-spanish-speakers a-lovo)
  (cond [(empty? a-lovo) empty]
        [else (if (contains-string (volunteer-org-languages (first a-lovo)) SPANISH)
              (cons (first a-lovo) (need-spanish-speakers (rest a-lovo)))
              (need-spanish-speakers (rest a-lovo)))]))
 