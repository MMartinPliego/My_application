//
//  StudentsViewController.swift
//  My_application
//
//  Created by Dev2 on 25/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Esto es para llamar a la tabla
        configureTableView()
    }
    
}

extension StudentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Configure tableView with default options
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultStudents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentsViewCell", for: indexPath) as! StudentsViewCell
        
        if (indexPath.row < defaultStudents.count) {
            let student = defaultStudents[indexPath.row]
            cell.configureCell(student: student)
        }
        
        return cell
    }
    

}
