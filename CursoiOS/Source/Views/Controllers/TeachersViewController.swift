//
//  TeachersViewController.swift
//  CursoiOS
//
//  Created by David Jardon on 26/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit


class TeachersViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
}

extension TeachersViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? TeacherDetailViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }

        destination.teacher = defaultTeachers[indexPath.row]
    }
}

extension TeachersViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Configure tableView with default options
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultTeachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherViewCell",
                                                       for: indexPath) as? TeacherViewCell else {
            return UITableViewCell()
        }
        
        if (indexPath.row < defaultTeachers.count) {
            let teacher = defaultTeachers[indexPath.row]
            cell.configureCell(teacher: teacher)
        }
        
        return cell
    }
}


