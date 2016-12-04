//
//  AppConstants.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

let FIRST_LAUNCH_DONE = "FirstLaunchDone"
let k_email = "Email"
let k_password = "Password"
let k_mobile = "Mobile"
let k_name = "Name"
let k_gender = "Gender"
let k_SavedLogins = "SavedLogins"


class AppConstants {
    
    static let shared = AppConstants()
    
    private init(){}
    
    func checkForLogin(email: String, password: String) -> Bool {
        if let savedLogins = UserDefaults.standard.object(forKey: k_SavedLogins) as? [AnyObject] {
            
            for obj in savedLogins {
                if let dic = obj as? Dictionary<String, AnyObject> {
                    let emailOr = dic[k_email] as! String
                    let passwordOr = dic[k_password] as! String
                    if email == emailOr && password == passwordOr {
                        self.currentLogin = dic
                        return true
                    }
                }
            }
        }
        return false
    }
    
    func register(name: String, email: String, mobile: String, gender: String, password: String) -> Bool{
        let person = [k_name : name, k_email : email, k_mobile : mobile, k_gender : gender, k_password : password]
        
        if let savedLogins = UserDefaults.standard.object(forKey: k_SavedLogins) as? [AnyObject] {
            var newArray = savedLogins
            newArray.append(person as AnyObject)
            UserDefaults.standard.set(newArray, forKey: k_SavedLogins)
            UserDefaults.standard.synchronize()
        } else {
            var newArray: [AnyObject] = []
            newArray.append(person as AnyObject)
            UserDefaults.standard.set(newArray, forKey: k_SavedLogins)
            UserDefaults.standard.synchronize()
            
        }
        self.currentLogin = person as Dictionary<String, AnyObject>!
        return true
    }
    
    var currentLogin : Dictionary<String, AnyObject>!
    
    var savedLogins : [AnyObject]? {
        get {
           return UserDefaults.standard.object(forKey: k_SavedLogins) as? [AnyObject]
        }
    }
    
    
}

extension UIViewController {
    
    func showAlert(message: String){
        let alertController = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

