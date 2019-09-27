//
//  TeacherViewCell.swift
//  My_application
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class TeachersViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var teacherView: UIView!
    @IBOutlet weak var imageViewTeacher: UIImageView!
    @IBOutlet weak var labelViewTeacherTittle: UILabel!
    @IBOutlet weak var labelViewTeacherdescription: UILabel!
        
    // MARK: - Func
    // Función para dejar la celda limpia de la tabla(siempre se implementa)
    override func prepareForReuse() {
        imageViewTeacher.image = nil
        labelViewTeacherTittle.text = nil
        labelViewTeacherdescription.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        teacherView.layer.cornerRadius = 12.0
        teacherView.configureShadows()
        
        // Para poner a solo radio a la parte de abajo de una view
        //      teacherView.layer.maskedCorners =
        //      [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    // Función que llena los datos de la celda con los datos de las variables que tenemos en DefaultData.swift
    func configureCell(teacher: Teacher) {
        // TODO: Add student image
        imageViewTeacher.image = UIImage(named: teacher.avatar ?? "")
        labelViewTeacherTittle.text = teacher.name
        labelViewTeacherdescription.text = teacher.email
    }
    
    
}



