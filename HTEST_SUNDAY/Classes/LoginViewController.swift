//
//  LoginViewController.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var password : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerClicked(_ sender: Any) {
        (self.navigationController as! AppNavigationControllerViewController).gotoRegistrationScreen()
    }
    
    @IBAction func LoginCliked(_ sender: Any) {
        
        let email = self.email.text
        let password = self.password.text
        
        if email != nil && email!.isEmpty {
            print("Empty Email!!")
            // alert users
            return
        }
        
        if password != nil && password!.isEmpty {
            print("empty password")
            return
        }
        
        let success = AppConstants.shared.checkForLogin(email: email!, password: password!)
        
        if success {
            (self.navigationController as! AppNavigationControllerViewController).gotoSavedLogin()
        } else {
            self.showAlert(message: "Invalid Logins")
        }

        
    }

}
