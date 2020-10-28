;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname meza-j-lab6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Jair Meza
;; jdmeza

;;1)
;;A course is a (make-course String Number String Natural ListOfStudents)
;;represents a course where
;; - department is the department offering the course
;; - course-number is a number that represents the course
;; - faculty is the faculty member teaching the course
;; - max is the maximum students allowed in the course
;; - students is a ListOfStudents in the course

;;A student is a (make-student String Number ListOfCourses)
;;represents a student where
;; - name is the student's name
;; - ID is the student ID number
;l - courses is a ListOfCourses the student is enrolled in

;; ListOfCourses is either
;; - empty
;; - (cons (make-course String Number String Natural ListOfStudents) ListOfCourses)

;; ListOfStudents is either
;; - empty
;; - (cons (make-student String Number ListOfCourses) ListOfStudents)