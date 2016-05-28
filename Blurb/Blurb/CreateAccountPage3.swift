//
//  CreateAccountPage3.swift
//  Blurb
//
//  Created by Jung Kim on 5/28/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit
import Firebase

class CreateAccountPage3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateAccountPage.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue) {}
    
}
