//
//  HomePage.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/12/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    
    
    @IBOutlet weak var homePageNavBar: UINavigationBar!

    @IBOutlet weak var blurbButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePageNavBar.topItem!.title = "Home Feed"
        
        blurbButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
