//
//  StudentDetailViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 30/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit


class StudentDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var section1Label: UILabel!
    @IBOutlet weak var section2Label: UILabel!
    @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func onDeletePressed(_ sender: UIButton) {
        
             // Para eliminar sobre lo que pulsemos en la pantalla
             let alert = UIAlertController(title: "Eliminar estudiante",
                                           message: "Vas a eliminar al estudiante, ¿Estás seguro?",
                                           preferredStyle: .alert)
             
             alert.addAction(UIAlertAction(title: "Eliminar",
                                           style: .destructive,
                                           handler: {[weak self] _ in
             
             defaultStudents.removeAll(where: { $0.name == self?.student?.name ?? ""})

                 // Para liberar el espacio de memoria del Clousure se pone [weak self] no dejar nada en memoria
                 self?.navigationController?.popViewController(animated: true)
             }))
             
             alert.addAction(UIAlertAction(title: "Cancelar",
                                           style: .cancel))

             
             present(alert, animated: true)
             
         }
    
    
    var student: Student?
    
    private var mStudentSubject: Array<Subject> = []
    private var mStudentTeacher: Array<Teacher> = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: student?.avatar)
        configure(title: student?.name)
        configure(subtitle: "")
        configure(section1: "Subjects")
        configure(section2: "Teachers")
        
        loadSubjectsAndTeacher(for: student?.name)
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

    func loadSubjectsAndTeacher(for studentName: String?) {
        guard let name = studentName else {
            return
        }
        
        mStudentSubject = filter(subjects: defaultSubjects,
                                     by: name)
        
        mStudentTeacher = Array(teachers(for: mStudentSubject))
    }

    func filter (subjects data: [Subject], by studentName: String) -> [Subject] {
        let studentSubjects = data.filter({ subject in
            let subjectStudents = filter(students: subject.students,
                                           by: studentName)
            
            return subjectStudents.count > 0
            
        })
        return studentSubjects
        
    }

    func filter (students data: [Student], by studentName: String) -> [Student] {
        let studentsForName = data.filter({ subjectStudent in
            guard let subjectStudentName = subjectStudent.name else {
                return false
            }
            return subjectStudentName == studentName
        })
        return studentsForName
        
    }

    func teachers (for data: [Subject]) -> Set<Teacher> {
        var subjectTeachers: Set<Teacher> = Set<Teacher>()
        data.forEach { subject in
            subject.teachers.forEach{ subjectTeachers.insert($0)}
        }
         return subjectTeachers
        
    }
    
}

extension StudentDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            case 0:
                return mStudentSubject.count

            case 1:
                return mStudentTeacher.count
        
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
                if indexPath.row < mStudentSubject.count {
                    let subject = mStudentSubject[indexPath.row]
                    cell.configureCell(image: subject.logo,
                                       title: subject.name)
                }
            
            case 1:
                if indexPath.row < mStudentTeacher.count {
                    let teacher = mStudentTeacher[indexPath.row]
                    cell.configureCell(image: teacher.avatar,
                                       title: teacher.name)
                }
            
            default:
                return UICollectionViewCell()
        }
        
        return cell
    }
    
}
