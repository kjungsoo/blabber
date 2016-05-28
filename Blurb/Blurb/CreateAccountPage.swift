//
//  CreateAccountPage.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/25/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit
import Firebase

enum dataReaderError: ErrorType {
    case mismatch
    case forbidden
}

class CreateAccountPage: UIViewController {
    
    func confirmInput(input1: UITextField, input2: UITextField) throws {
        if input1.text! != input2.text! {
            throw dataReaderError.mismatch
        }
    }
    
    func confirmLegalPwInput(input: Int) throws {
        if input < 2 {
            throw dataReaderError.forbidden
        }
    }
    
    var userChecked: Bool = false
    var legalPwChecked: Bool = false
    var passwordChecked: Bool = false
    
    @IBOutlet weak var emailErrorMessage: UITextView!
    @IBOutlet weak var pwErrorMessage: UITextView!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var confirmEmailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var confirmPwField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func emailCheck(sender: AnyObject) {
        
    }
    
    @IBAction func confirmAccCheck(sender: AnyObject) {
        
        var errorMessage: String = ""
        
        if emailField.text != confirmEmailField.text {
            do {
                try confirmInput(emailField, input2: confirmEmailField)
            } catch dataReaderError.mismatch {
                errorMessage = "Entered e-mails do not match."
            } catch {
                errorMessage = "Check failed"
            }
            if errorMessage != "" {
                emailErrorMessage.text = errorMessage
                //emailErrorMessage.textAlignment = NSTextAlignment.Center
                emailErrorMessage.textColor = UIColor.redColor()
                emailErrorMessage.hidden = false
            }
        }
        else {
            emailErrorMessage.hidden = true
            userChecked = true
        }
    }
    
    @IBAction func pwCheck(sender: AnyObject) { //decide where to show this
        
        let test = passwordField.text! as String
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        
        var digitCount = 0
        
        for uni in test.unicodeScalars {
            if digits.longCharacterIsMember(uni.value) {
                digitCount += 1
            }
        }
        
        var errorMessage: String = ""
        
        do {
            try confirmLegalPwInput(digitCount)
        } catch dataReaderError.forbidden {
            errorMessage = "Your password must include at least 2 numbers"
        } catch {
            errorMessage = "Check failed"
        }
        if errorMessage != "" {
            
        }
        
    }
    
    @IBAction func confirmPwCheck(sender: AnyObject) {
        
        var errorMessage: String = ""
        
        if passwordField.text != confirmPwField.text {
            do {
                try confirmInput(passwordField, input2: confirmPwField)
            } catch dataReaderError.mismatch {
                errorMessage = "Entered passwords do not match"
            } catch {
                errorMessage = "Check failed"
            }
            if errorMessage != "" {
                pwErrorMessage.text = errorMessage
                pwErrorMessage.textColor = UIColor.redColor()
                pwErrorMessage.hidden = false
            }
        }
        else {
            pwErrorMessage.hidden = true
            passwordChecked = true
        }
        
    }
    
    @IBAction func signUpButtonAction(sender: AnyObject) {
        BASE_REF.createUser(emailField.text!, password: passwordField.text!, withValueCompletionBlock: { (error, result) in
            if error == nil {
                let uid = result["uid"] as! String
                let user = ["username" : self.usernameField.text!, "bio" : ""]
                BASE_REF.childByAppendingPath("users/\(uid)").setValue(user)
                print("Successfully created a user with uid: \(uid)")
            } else {
                print("ERROR: Sign up error")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

