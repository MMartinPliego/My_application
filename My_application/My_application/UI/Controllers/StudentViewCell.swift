//
//  StudentViewCell.swift
//  My_application
//
//  Created by Dev2 on 25/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class StudentsViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var studentView: UIView!
    @IBOutlet weak var imageViewStudent: UIImageView!
    @IBOutlet weak var labelViewStudenttittle: UILabel!
    @IBOutlet weak var labelViewStudentdescription: UILabel!
        
    // MARK: - Func
    // Función para dejar la celda limpia de la tabla(siempre se implementa)
    override func prepareForReuse() {
        imageViewStudent.image = nil
        labelViewStudenttittle.text = nil
        labelViewStudentdescription.text = nil
    }
    
    // Función que llena los datos de la celda con los datos de las variables que tenemos en DefaultData.swift
    func configureCell(student: Student) {
        // TODO: Add student image
        labelViewStudenttittle.text = student.name
        labelViewStudentdescription.text = student.email
    }
    
    
    
}
