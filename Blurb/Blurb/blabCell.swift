//
//  blabCell.swift
//  Blurb
//
//  Created by Kevin Nguyen on 5/15/16.
//  Copyright © 2016 Kevin Nguyen. All rights reserved.
//

import UIKit

class blabCell: UITableViewCell {
    
    @IBOutlet weak var blabLabel: UILabel!

    @IBOutlet weak var timeStampLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var subBlabButton: UIButton!
    
    @IBAction func subBlabButtonAction(sender: AnyObject) {
        print("Hi")
    }
    
    @IBOutlet weak var influenceButton: UIButton!
    
    @IBAction func influenceButtonAction(sender: AnyObject) {
        print("Yo")
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
