//
//  DefaultData.swift
//  My_application
//
//  Created by Dev2 on 23/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

//MARK: - Created lista de Studens

var defaultStudents = [Student(name: "Juana",
                               email: "juana@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1985,
                                                                                     month: 1)),
                               avatar: "img_student_1"),
                       Student(name: "Luis",
                               email: "luis@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1975,
                                                                                     month: 4)),
                               avatar: "img_student_2"),
                       Student(name: "Ángel",
                               email: "angel@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1988,
                                                                                     month: 9)),
                               avatar: "img_student_3"),
                       Student(name: "Gema",
                               email: "gema@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1980,
                                                                                     month: 7)),
                               avatar: "img_student_4"),
                       Student(name: "Maria",
                               email: "maria@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                     month: 2)),
                               avatar: "img_student_5"),
                       Student(name: "Guille",
                               email: "guille@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1998,
                                                                                     month: 10)),
                               avatar: "img_student_6"),
                       Student(name: "Laura",
                               email: "laura@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1996,
                                                                                     month: 5)),
                               avatar: "img_student_7")]
//MARK: - Created lista de Teachers

let defaultTeachers = [Teacher(name: "Luisa",
                               email: "luisa@gmail.com",
                               type: .extern,
                               avatar: "img_teacher_1"),
                       Teacher(name: "Lucía",
                               email: "lucia@gmail.com",
                               type: .extern,
                               avatar: "img_teacher_2"),
                       Teacher(name: "Manu",
                               email: "manu@gmail.com",
                               type: .intern,
                               avatar: "img_teacher_3"),
                       Teacher(name: "Edu",
                               email: "edu@gmail.com",
                               type: .extern,
                               avatar: "img_teacher_4"),
                       Teacher(name: "Paco",
                               email: "paco@gmail.com",
                               type: .intern,
                               avatar: "img_teacher_5")]

//MARK: - Created lista de Subjects

let defaultSubjects = [Subject(name: "Android",
                               teachers: defaultTeachers.filter{$0.name?.contains("a") ?? false},  //$0 es teacher y se trata de un clouser
                                students: defaultStudents.filter{$0.name?.contains("u") ?? false},
                                avatar: "img_subject_android"),
                       Subject(name: "Dart",
                               teachers: defaultTeachers.filter{$0.name?.contains("e") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("o") ?? false},
                               avatar: "img_subject_dart"),
                       Subject(name: "iOS",
                               teachers: defaultTeachers.filter{$0.name?.contains("i") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("i") ?? false},
                               avatar: "img_subject_ios"),
                       Subject(name: "Javascript",
                               teachers: defaultTeachers.filter{$0.name?.contains("o") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("e") ?? false},
                               avatar: "img_subject_javascript"),
                       Subject(name: "Python",
                               teachers: defaultTeachers.filter{$0.name?.contains("u") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("a") ?? false},
                               avatar: "img_subject_python")]

