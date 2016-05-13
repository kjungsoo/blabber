//
//  NotificationsPage.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/12/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

class NotificationsPage: UIViewController {

    @IBOutlet weak var notificationsPageNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsPageNavBar.topItem!.title = "Notifications"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
