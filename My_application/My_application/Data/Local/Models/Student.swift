//
//  Student.swift
//  My_application
//
//  Created by Dev2 on 20/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import Foundation

class Student: CustomStringConvertible {
    
    var avatar: String?
    var name: String?
    var email: String?
    var birthdate: Date?
    
    //Uso de var descripcion es para CustomStringConvertible
    //Imprime los datos de la clase Student en un String
    var description: String {
        return "Student data: \(String(describing: name)) \(String(describing: email))"
    }
    
    //Customiza el constructor
    convenience init(name: String, email: String? = nil, birthdate: Date? = nil, avatar: String? = nil) {
        
        self.init()
        
        self.name = name
        self.email = email
        self.birthdate = birthdate
        self.avatar = avatar
    }
    
    
}
