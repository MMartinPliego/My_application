//
//  TeacherDetailViewController.swift
//  CursoiOS
//
//  Created by Dev2 on 30/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit


class TeacherDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var section1Label: UILabel!
    @IBOutlet weak var section2Label: UILabel!
    @IBOutlet var dataCollectionView: Array<UICollectionView>!
    @IBOutlet weak var deleteButton: UIButton!
    
    var teacher: Teacher?
    private var mTeacherSubject: Array<Subject> = []
    private var mTeacherStudent: Array<Student> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(image: teacher?.avatar)
        configure(title: teacher?.name)
        configure(subtitle: "")
        configure(section1: "Subject")
        configure(section2: "Students")
        
        loadSubjectsAndStudent(for: teacher?.name)
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
    
    func loadSubjectsAndStudent(for teacherName: String?) {
        guard let name = teacherName else {
            return
        }
        
        mTeacherSubject = filter(for: defaultSubjects,
                                 by: name)
        
        mTeacherStudent = Array(students(for: mTeacherSubject))
    }

    func filter (for data: [Subject], by teacherName: String) -> [Subject] {
        let teacherSubjects = data.filter({ subject in
            let subjectTeachers = filter(teacher: subject.teachers,
                                           by: teacherName)
            
            return subjectTeachers.count > 0
            
        })
        return teacherSubjects
        
    }
    
    func filter (teacher data: [Teacher], by studentName: String) -> [Teacher] {
        let studentsTeacher = data.filter({ teacherStudent in
            guard let subjectStudentName = teacherStudent.name else {
                return false
            }
            return subjectStudentName == studentName
        })
        return studentsTeacher
        
    }
    
    func students (for data: [Subject]) -> Set<Student> {
        var subjectTeacher: Set<Student> = Set<Student>()
        data.forEach { subject in
            subject.students.forEach{ subjectTeacher.insert($0)}
        }
         return subjectTeacher
        
    }
    
}

extension TeacherDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    switch collectionView.tag {
        case 0:
            return mTeacherStudent.count

        case 1:
            return mTeacherSubject.count
    
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
                    if indexPath.row < mTeacherSubject.count {
                        let subject = mTeacherSubject[indexPath.row]
                        cell.configureCell(image: subject.logo,
                                           title: subject.name)
                    }
                
                case 1:
                    if indexPath.row < mTeacherStudent.count {
                        let teacher = mTeacherStudent[indexPath.row]
                        cell.configureCell(image: teacher.avatar,
                                           title: teacher.name)
                    }
                
                default:
                    return UICollectionViewCell()
            }
            
            return cell
        }
        
    }
