//
//  DefaultData.swift
//  My_application
//
//  Created by Dev2 on 23/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

//MARK: - Created lista de Studens

var defaultStudents = [Student(name: "Pepe",
                               email: "pepe@gmail.com",
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
                       Student(name: "Josito",
                               email: "josito@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1980,
                                                                                     month: 7)),
                               avatar: "img_student_4"),
                       Student(name: "Alfredo",
                               email: "alfredo@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1983,
                                                                                     month: 2)),
                               avatar: "img_student_5"),
                       Student(name: "Bea",
                               email: "bea@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1998,
                                                                                     month: 10)),
                               avatar: "img_student_6"),
                       Student(name: "Marisol",
                               email: "marisol@gmail.com",
                               birthdate: Calendar.current.date(from: DateComponents(year: 1996,
                                                                                     month: 5)),
                               avatar: "img_student_7")]
//MARK: - Created lista de Teachers

let defaultTeachers = [Teacher(name: "Manu",
                               email: "manu@gmail.com",
                               type: .extern),
                       Teacher(name: "Edu",
                               email: "edu@gmail.com",
                               type: .extern),
                       Teacher(name: "Eva",
                               email: "eva@gmail.com",
                               type: .intern),
                       Teacher(name: "Luisa",
                               email: "luisa@gmail.com",
                               type: .extern),
                       Teacher(name: "Lucia",
                               email: "lucia@gmail.com",
                               type: .intern)]

//MARK: - Created lista de Subjects

let defaultSubjects = [Subject(name: "Android",
                               teachers: defaultTeachers.filter{$0.name?.contains("a") ?? false},  //$0 es teacher y se trata de un clouser
                                students: defaultStudents.filter{$0.name?.contains("u") ?? false}),
                       Subject(name: "Matemáticas",
                               teachers: defaultTeachers.filter{$0.name?.contains("e") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("o") ?? false}),
                       Subject(name: "Física",
                               teachers: defaultTeachers.filter{$0.name?.contains("i") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("i") ?? false}),
                       Subject(name: "iOS",
                               teachers: defaultTeachers.filter{$0.name?.contains("o") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("e") ?? false}),
                       Subject(name: "Biología",
                               teachers: defaultTeachers.filter{$0.name?.contains("u") ?? false},
                               students: defaultStudents.filter{$0.name?.contains("a") ?? false})]

