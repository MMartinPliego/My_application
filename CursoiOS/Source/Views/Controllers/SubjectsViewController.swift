//
//  SubjectsViewController.swift
//  CursoiOS
//
//  Created by Manuel Martín on 26/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    // Eliminar la asignatura al pulsar sobre el botón
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
}


extension SubjectsViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? SubjectDetailViewController,
              let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else {
            return
        }

        destination.subject = defaultSubjects[indexPath.row]
    }
}





extension SubjectsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// Configure collectionView with default options
    func configureView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return defaultSubjects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.cellIdentifier,
                                                       for: indexPath) as? DetailViewCell else {
            return UICollectionViewCell()
        }
        
        if (indexPath.row < defaultSubjects.count) {
            let subject = defaultSubjects[indexPath.row]
            cell.configureCell(image: subject.logo,
                               title: subject.name)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - 16.0) / 2
        return CGSize(width: size,
                      height: size)
    }
}

