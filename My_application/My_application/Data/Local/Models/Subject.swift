//
//  Subject.swift
//  My_application
//
//  Created by Dev2 on 20/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation


class Subject {
    
    var name: String?
    var teachers: [Teacher] = [] //los arrays siempre devolverlos como vacios y nunca como nil u opcionales
    var students: [Student] = []
    
    //Variable autocompotada, cada vez que se llama a la variable hace el cálculo (no guarda datos en ella)
    var numTeachers: Int {
        return teachers.count
    }
    var numStudens: Int {
        return students.count
    }
    
    //variable autocalculada
    //    var numStudens: Int {
    // return students?.count ?? 0
    
    convenience init(name: String, teachers: [Teacher] = [], students: [Student] = []) {
        self.init ()
        
        self.name = name
        self.teachers = teachers
        self.students = students
    }
}
