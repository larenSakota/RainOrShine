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

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddCityMode = presentingViewController is UINavigationController
 
        if isPresentingInAddCityMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The AddCittyVC is not inside a navigation controller.")
        }
    }

}
