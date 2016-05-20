//
//  HomePage.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/12/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

// Blab struct defined a blab: blabString, timeStamp,
struct Blab {
    let username : String
    let blabString : String
    let timeStamp : String
}

func == (a: Blab, b: Blab) -> Bool {
    return a.username == b.username && a.blabString == b.blabString && a.timeStamp == b.timeStamp
}

let user = "Nagoogin"

class HomePage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var blabTextField: UITextField!
    
    @IBOutlet weak var blabTableView: UITableView!
    
    @IBOutlet weak var homePageNavBar: UINavigationBar!

    @IBOutlet weak var blurbButton: UIButton!
    
    // Sets the length limit of a blab to 40 characters, unfortunately including spaces.
    @IBAction func textFieldAction(sender: AnyObject) {
        let maxLength = 40
        if blabTextField.text?.characters.count > maxLength {
            blabTextField.deleteBackward()
        }
    }
    var blabList = [testBlab1, testBlab2, testBlab3, testBlab4]
    var userBlabList = [testBlab2]
    
    // This function returns a string for the date given an NSDate date
    func getTimeStamp(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .ShortStyle
        return dateFormatter.stringFromDate(date)
    }
    
    @IBAction func blabButtonAction(sender: AnyObject) {
        if (blabTextField.text != "") {
            // Saves the time of blab submission
            let username = user
            let currentTime = NSDate()
            let newBlab = Blab(username: username, blabString: blabTextField.text!, timeStamp: getTimeStamp(currentTime))
            // Appends a new Blab object to the blabList array
            blabList.insert(newBlab, atIndex: 0)
            userBlabList.insert(newBlab, atIndex: 0)
            
            // Sets the textField back to empty view
            blabTextField.text = ""
            
            // Updates the table view with the new added row
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.blabTableView.reloadData()
            })
            
            dismissKeyboard()
            
            // DELETE THIS PRIOR TO DEPLOYMENT, OR ELSE, RIP
            print(blabList)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePageNavBar.topItem!.title = "Home Feed"
        
        blurbButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomePage.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return blabList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let blabbedCell = self.blabTableView.dequeueReusableCellWithIdentifier("bCell", forIndexPath: indexPath) as! blabCell
        
        blabbedCell.usernameLabel.text = blabList[indexPath.row].username
        blabbedCell.blabLabel.text = blabList[indexPath.row].blabString
        
        if blabList[indexPath.row].username == user {
            // If you are the poster, then the text of the blab is in medium weight and app green
            blabbedCell.blabLabel.textColor = UIColor(red:0.0, green:0.545, blue:0.271, alpha:1.0)
            blabbedCell.blabLabel.font = UIFont(name: "AvenirNext-Medium", size: 14.0)
        } else {
            blabbedCell.blabLabel.textColor = UIColor.blackColor()
            blabbedCell.blabLabel.font = UIFont(name: "AvenirNext-Regular", size: 14.0)
        }
        
        // Checks if cell is the first of the user's blabs, then highlight it in green. It's too bad this control flow block has to be separate from the one above because otherwise it won't exhaustively check all the cells.
        
        if blabList[indexPath.row] == userBlabList[0] {
            blabbedCell.backgroundColor = UIColor(red: 0.867, green: 0.988, blue: 0.867, alpha: 1.0)
        } else {
            blabbedCell.backgroundColor = UIColor.whiteColor()
        }

        
        blabbedCell.timeStampLabel.text = blabList[indexPath.row].timeStamp
        
        return blabbedCell
    }
    
//    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        cell.separatorInset = UIEdgeInsetsZero
//        cell.layoutMargins = UIEdgeInsetsZero
//    }
    
}
