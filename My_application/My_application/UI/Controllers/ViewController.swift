//
//  ViewController.swift
//  My_application
//
//  Created by Dev2 on 19/09/2019.
//  Copyright © 2019 Orum Games. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlet es común para todas las vistas que hagamos, para saber que hace cada elemento que tengamos dentro del @IB
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //IBAction son acciones (son funciones, se utilizan para capturar eventos)
    @IBAction func onButtonPressed( _ sender: UIButton) {
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

