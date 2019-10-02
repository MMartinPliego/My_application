//
//  UIView+Utils.swift
//  CursoiOS
//
//  Created by Manuel Martín on 27/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit

extension UIView {
    func configureShadows(color: UIColor = UIColor.black,
                          opacity: Float = 0.5,
                          radius: CGFloat = 8.0,
                          offset: CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
