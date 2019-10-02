//
//  SubjectDetailViewController.swift
//  CursoiOS
//
//  Created by Manuel Martín on 27/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit

class SubjectDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var section1Label: UILabel!
    @IBOutlet weak var section2Label: UILabel!
    @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func onDeletePressed(_ sender: UIButton) {
    
        // Para eliminar sobre lo que pulsemos en la pantalla
        let alert = UIAlertController(title: "Eliminar asignatura",
                                      message: "Vas a eliminar la asignatura, ¿Estás seguro?",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Eliminar",
                                      style: .destructive,
                                      handler: {[weak self] _ in
        
        defaultSubjects.removeAll(where: { $0.name == self?.subject?.name ?? ""})

            // Para liberar el espacio de memoria del Clousure se pone [weak self] no dejar nada en memoria
            self?.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancelar",
                                      style: .cancel))

        
        present(alert, animated: true)
        
    }
    
    
    var subject: Subject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: subject?.logo)
        configure(title: subject?.name)
        configure(subtitle: "")
        configure(section1: "Teachers")
        configure(section2: "Students")
        
        configureCollectionsView()
    }
    
    func configure(image: String?) {
        guard let imageData = image else {
            imageView.image = nil
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
    
    func configureCollectionsView() {
        dataCollectionView.forEach{ collectionView in
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
}

extension SubjectDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            case 0:
                return subject?.teachers.count ?? 0

            case 1:
                return subject?.students.count ?? 0
        
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailViewCell.cellIdentifier,
                                                            for: indexPath) as? DetailViewCell else {
                                                                return UICollectionViewCell()
        }
        
        switch collectionView.tag {
            case 0:
                if let teachers = subject?.teachers, indexPath.row < teachers.count {
                    let teacher = teachers[indexPath.row]
                    cell.configureCell(image: teacher.avatar,
                                       title: teacher.name)
                }
            
            case 1:
                if let students = subject?.students, indexPath.row < students.count {
                    let student = students[indexPath.row]
                    cell.configureCell(image: student.avatar,
                                       title: student.name)
                }
            
            default:
                return UICollectionViewCell()
        }
        
        return cell
    }
    
}
