//
//  CreateAccountPage3.swift
//  Blurb
//
//  Created by Jung Kim on 5/28/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

class CreateAccountPage3: UIViewController {
    
    @IBAction func signUpButtonAction(sender: AnyObject) {
//        BASE_REF.createUser(emailField.text!, password: passwordField.text!, withValueCompletionBlock: { (error, result) in
//            if (self.emailChecked == true && self.legalPwChecked == true && self.passwordChecked == true) {
//                if error == nil {
//                    let uid = result["uid"] as! String
//                    let user = ["username" : self.usernameField.text!, "bio" : ""]
//                    BASE_REF.childByAppendingPath("users/\(uid)").setValue(user)
//                    print("Successfully created a user with uid: \(uid)")
//                } else {
//                    print("ERROR: Sign up error")
//                    //couldn't access firebase, bad internet; resulted in error -> provide red warning messages to user!
//                }
//            }
//            else {
//                //add red warning message telling user to fulfill everything
//            }
//        })
    }
    
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
    
    @IBAction func unindToLogin(segue: UIStoryboardSegue) {}
    
}
