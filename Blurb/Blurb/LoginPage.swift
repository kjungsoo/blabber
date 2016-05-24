//
//  LoginPage.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/12/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {
    
    let ref = Firebase(url: "https://blurb.firebaseio.com")
    
    let loginToApp: String = "loginToApp"

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonAction(sender: AnyObject) {
        self.ref.authUser(emailField.text, password: passwordField.text, withCompletionBlock: { (error, auth) in })
        
    }
    
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpButtonAction(sender: AnyObject) {
        
        self.ref.createUser(emailField.text, password: passwordField.text) { (error: NSError!) in
            if error == nil {
                self.ref.authUser(self.emailField.text, password: self.passwordField.text,
                                  withCompletionBlock: { (error, auth) -> Void in
                })
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
        
        signUpButton.layer.cornerRadius = 5
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        ref.observeAuthEventWithBlock { (authData) -> Void in
            if authData != nil {
                self.performSegueWithIdentifier(self.loginToApp, sender: nil)
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
