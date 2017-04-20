//
//  AddCityVC.swift
//  RainOrShine
//
//  Created by Laren Sakota on 4/16/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit
import os.log

class AddCityVC: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    


    // MARK: - Navigation

    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
