//
//  SubjectsViewController.swift
//  My_application
//
//  Created by Dev2 on 26/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//


import UIKit

class SubjectsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
    }
    
}

extension SubjectsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultSubjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "SubjectsViewCell", for: indexPath) as! SubjectViewCell
        
        if (indexPath.row < defaultSubjects.count) {
            let subject = defaultSubjects [indexPath.row]
            collection.configureCell(subject: subject)
        }
        
        return collection
    }
    

}

