//
//  SubjectViewCell.swift
//  My_application
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class SubjectViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var subjectView: UIView!
    @IBOutlet weak var imageViewSubject: UIImageView!
    @IBOutlet weak var labelViewSubjectTittle: UILabel!
        
    // MARK: - Func
    // Función para dejar la celda limpia de la tabla(siempre se implementa)
    override func prepareForReuse() {
        imageViewSubject.image = nil
        labelViewSubjectTittle.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    subjectView.dropShadowSubject()
        
    }
    

    
    // Función que llena los datos de la celda con los datos de las variables que tenemos en DefaultData.swift
    func configureCell(subject: Subject) {
        // TODO: Add student image
        imageViewSubject.image = UIImage(named: subject.avatar ?? "")
        labelViewSubjectTittle.text = subject.name
    }
    
    
}

extension UIView {
    func dropShadowSubject(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
