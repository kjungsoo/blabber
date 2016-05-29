//
//  CreateAccountPage.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/25/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit
//import Firebase

enum dataReaderError: ErrorType {
    case mismatch
    case forbidden
    case lengthOver
    case lengthUnder
}

class CreateAccountPage: UIViewController {
    
    var userChecked: Bool = false
    var legalEmailChecked: Bool = false
    var emailChecked: Bool = false
    var legalPwChecked: Bool = false
    var passwordChecked: Bool = false
    
    func confirmInput(input1: UITextField, input2: UITextField) throws {
        if input1.text! != input2.text! {
            throw dataReaderError.mismatch
        }
    }
    
    func confirmLegalInput(input: Int) throws {
        if input < 2 {
            throw dataReaderError.forbidden
        }
    }
    
    func confirmLengthInput(input: Int, user: Bool) throws {
        
        if input < 4 && user == true {
            throw dataReaderError.lengthUnder
        }
        else if input < 8 && user == false {
            throw dataReaderError.lengthUnder
        }
        else if input > 16 {
            throw dataReaderError.lengthOver
        }
    }
    
    @IBOutlet weak var emailErrorMessage: UITextView!
    @IBOutlet weak var emailReqErrorMessage: UITextView!
    @IBOutlet weak var pwErrorMessage: UITextView!
    @IBOutlet weak var pwReqErrorMessage: UITextView!
    @IBOutlet weak var pwReq2ErrorMessage: UITextView!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var confirmEmailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPwField: UITextField!
    
    @IBOutlet weak var pwReqField: UITextView!
    @IBOutlet weak var pwReq2Field: UITextView!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func usernameCheck(sender: AnyObject) {
        //check for hate lang
        //check for length 4-16 characters
        //no special character allowed
        //no white spaces
    }
    
    @IBAction func emailCheck(sender: AnyObject) {
        
        let validEmailtest = emailField.text! as String
        
        var validEmailcount = 0
        
        for uni in validEmailtest.unicodeScalars {
            if uni.value == 64 { // @ == 64
                validEmailcount += 1
            }
            if uni.value == 46 { // . == 46 big problem, emails can contain multiple '.'s
                validEmailcount += 1 //screw checking if email is a valid format and use email activation to validate
            }
        }
        
        var errorMessage: String = ""
        
        do {
            try confirmLegalInput(validEmailcount)
        } catch dataReaderError.forbidden {
            errorMessage = "The e-mail address you entered is invalid."
        } catch {
            errorMessage = "Check failed"
        }
        if errorMessage != "" {
            emailReqErrorMessage.text = errorMessage
            emailReqErrorMessage.textColor = UIColor.redColor()
            emailReqErrorMessage.hidden = false
            
        }
        else {
            emailReqErrorMessage.hidden = true
            legalEmailChecked = true
        }
        
    }
    
    @IBAction func confirmEmailCheck(sender: AnyObject) {
        
        var errorMessage: String = ""
        
        do {
            try confirmInput(emailField, input2: confirmEmailField)
        } catch dataReaderError.mismatch {
            errorMessage = "Entered e-mails do not match."
        } catch {
            errorMessage = "Check failed"
        }
        if errorMessage != "" {
            emailErrorMessage.text = errorMessage
            emailErrorMessage.textColor = UIColor.redColor()
            emailErrorMessage.hidden = false
        }
        else {
            emailErrorMessage.hidden = true
            emailChecked = true
        }
    }
    
    @IBAction func pwCheck(sender: AnyObject) { //decide where to show this
        
        let test = passwordField.text! as String
        
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        
        let lengthCount = test.characters.count
        var digitCount = 0
        
        for uni in test.unicodeScalars {
            if digits.longCharacterIsMember(uni.value) {
                digitCount += 1
            }
        }
        
        var errorMessage: String = ""
        
        do {
            try confirmLegalInput(digitCount)
        } catch dataReaderError.forbidden {
            errorMessage = "Your password must include at least 2 numbers"
        } catch {
            errorMessage = "Check failed"
        }
        if errorMessage != "" {
            pwReqField.hidden = true
            pwReqErrorMessage.text = errorMessage
            pwReqErrorMessage.textColor = UIColor.redColor()
            pwReqErrorMessage.hidden = false
            legalPwChecked = false
        }
        else {
            pwReqErrorMessage.hidden = true
            pwReqField.hidden = false
            legalPwChecked = true
        }
        
        var errorMessage2: String = ""
        
        do {
            try confirmLengthInput(lengthCount, user: false)
        } catch dataReaderError.lengthUnder { //if lengthUnder, error textview is too shifted to left, ugly af. o well
            errorMessage2 = "Your password must have at least 8 characters."
        } catch dataReaderError.lengthOver {
            errorMessage2 = "Your password cannot be longer than 16 characters."
        } catch {
            errorMessage2 = "Check failed"
        }
        if errorMessage2 != "" {
            pwReq2Field.hidden = true
            pwReq2ErrorMessage.text = errorMessage2
            pwReq2ErrorMessage.textColor = UIColor.redColor()
            pwReq2ErrorMessage.hidden = false
            legalPwChecked = false
        }
        else {
            pwReq2ErrorMessage.hidden = true
            pwReq2Field.hidden = false
            legalPwChecked = true
        }
        
        //annoying stuff below
        if passwordField.text == confirmPwField.text {
            pwErrorMessage.hidden = true
        }
        
        if passwordField.text == "" {
            pwReqErrorMessage.hidden = true
            pwReqField.hidden = false
        }
        
        if passwordField.text != confirmPwField.text && confirmPwField.text != "" {
            pwErrorMessage.hidden = false
        }
        
    }
    
    @IBAction func confirmPwCheck(sender: AnyObject) {
        
        var errorMessage: String = ""
        
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
            
        else {
            pwErrorMessage.hidden = true
            passwordChecked = true
        }
        
    }
    
    @IBAction func signUpButtonAction(sender: AnyObject) {
        BASE_REF.createUser(emailField.text!, password: passwordField.text!, withValueCompletionBlock: { (error, result) in
            if (self.emailChecked == true && self.legalPwChecked == true && self.passwordChecked == true) {
                if error == nil {
                    let uid = result["uid"] as! String
                    let user = ["username" : self.usernameField.text!, "bio" : ""]
                    BASE_REF.childByAppendingPath("users/\(uid)").setValue(user)
                    print("Successfully created a user with uid: \(uid)")
                } else {
                    print("ERROR: Sign up error") //if email is already in use, it doesnt give error, need to create exception handling if email is already in use
                    //couldn't access firebase, bad internet; resulted in error -> provide red warning messages to user!
                }
            }
            else {
                //add red warning message telling user to fulfill everything
            }
        })
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
    
}

