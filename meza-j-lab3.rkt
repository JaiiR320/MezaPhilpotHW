;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname meza-j-lab3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Jair Meza
; jdemza

; 1)
(define-struct volunteer-org (kind name age consent? license? training hours languages) )
;; volunteer-org is a (make-volunteer-org kind name age consent? license? training hours languages)
;; represents a volunteer orginization where:
;;  - kind is the kind of orginization (String)
;;  - name is the name of the org (String)
;;  - age is the age of the org (Natural)
;;  - consent? is whether or not the org requires parental consent
;;      #true if required, #false if not required (Boolean)
;;  - license? is whether or not the must hold a drivers license
;;      #true if required, #false if not required (Boolean)
;;  - training is the number of hours of training for volunteers (Number)
;;  - hours is the minimum work hours per week for a volunteer (Number)
;;  - languages is a list of each language spoken by a volunteer (ListOfStrings)
;;    where ListOfStrings is one of
;;     - empty
;;     - (const String ListOfStrings)

(define SP-EN-FR (cons "spanish" (cons "english" (cons "french" empty))))
(define EN (cons "english" empty))
(define EN-KR (cons "english" (cons "korean" empty)))

;; examples
(define FOOD-BANK (make-volunteer-org "Food Bank" "Munch" 16 true false 12 20 SP-EN-FR))
(define CLEAN-PARK (make-volunteer-org "Park Cleaning" "Clean Park" 18 false true 2 16 EN))
(define SAVE-THE-BAY (make-volunteer-org "Save The Bay" "Bay Area Restoration" 14 true false 0 8 EN-KR))

