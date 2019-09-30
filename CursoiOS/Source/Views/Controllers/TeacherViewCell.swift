//
//  TeacherViewCell.swift
//  CursoiOS
//
//  Created by David Jardon on 26/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit


class TeacherViewCell: UITableViewCell {
    
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    
    
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelEmail.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    func configureCell(teacher: Teacher) {
        mImage.image = UIImage(named: teacher.avatar ?? "")
        mLabelName.text = teacher.name
        mLabelEmail.text = teacher.email
    }
}
