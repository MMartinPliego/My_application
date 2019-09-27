//
//  UIView+Utils.swift
//  My_application
//
//  Created by Dev2 on 27/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

    //modificar vista de la view (darles propiedas como borde redondeado, color de sombra, opacidad, etc.)
extension UIView {
    func configureShadows(color: UIColor = UIColor.black,
                          opacity: Float = 0.6,
                          radius: CGFloat = 8.0,
                          offset: CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
}
