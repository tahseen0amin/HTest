//
//  AccountCell.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {
    
    @IBOutlet weak var name : UILabel!
    @IBOutlet weak var email : UILabel!
    @IBOutlet weak var mobile : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(dict: Dictionary<String, AnyObject>){
        self.name.text = dict[k_name] as? String
        self.email.text = dict[k_email] as? String
        self.mobile.text = dict[k_mobile] as? String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
