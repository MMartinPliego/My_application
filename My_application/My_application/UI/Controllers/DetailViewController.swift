//
//  DetailViewController.swift
//  My_application
//
//  Created by Dev2 on 27/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class  DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var section1Label: UILabel!
    @IBOutlet weak var section2Label: UILabel!
    @IBOutlet var dataCollectionView:
        Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var data: Subject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: data?.avatar)
        configure(title: data?.name)
        configure(section1: "Teacher")
        configure(section2: "Subject")
        configure(subtitle: "")
    }
    
    func configure(image: String?) {
        guard let imageData = image else {
            return
        }
        imageView.image = UIImage(named: imageData)
    }
    
    func configure(title: String?) {
        titleLabel.text = title
    }
    
    func configure(subtitle: String?) {
        subtitleLabel.text = subtitle
    }
    
    func configure(section1: String?) {
        section1Label.text = section1
    }
    
    func configure(section2: String?) {
        section2Label.text = section2
    }
    
    func configureCollentionView() {
        dataCollectionView.forEach{ dataCollectionView in
            dataCollectionView.dataSource = self
            dataCollectionView.delegate = self
        }
        
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
        case 0:
            return data?.teachers.count ?? 0
        case 1:
            return data?.students.count ?? 0
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
