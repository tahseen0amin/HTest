//
//  SavedAccountListViewController.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

class SavedAccountListViewController: UITableViewController {
    
    var tableArraySection1 : [AnyObject]! = []
    var tableArraySection2 : [AnyObject]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: "AccountCell", bundle: nil), forCellReuseIdentifier: "AccountCell")
        // list all the saved account in seperate section
        if AppConstants.shared.savedLogins != nil && AppConstants.shared.savedLogins!.count > 1 {
            let savedLogins = AppConstants.shared.savedLogins!
            var savedLogisWithoutCurrent : [AnyObject] = []
            for obj in savedLogins {
                if let dic = obj as? Dictionary<String, AnyObject> {
                    if (dic[k_email] as! String) != (AppConstants.shared.currentLogin![k_email] as! String){
                        savedLogisWithoutCurrent.append(dic as AnyObject)
                    }
                }
            }
            self.tableArraySection2 = savedLogisWithoutCurrent
            
        }
        
        self.tableArraySection1 = [AppConstants.shared.currentLogin as AnyObject]
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Current Login"
        } else {
            return "Other Saved Logins"
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return self.tableArraySection1.count
        } else {
            return self.tableArraySection2.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        if indexPath.section == 0 {
            cell.setupCell(dict: self.tableArraySection1[indexPath.row] as! Dictionary<String, AnyObject>)
        } else {
            cell.setupCell(dict: self.tableArraySection2[indexPath.row] as! Dictionary<String, AnyObject>)
        }
        // Configure the cell...

        return cell
    }
 

    
    
}
