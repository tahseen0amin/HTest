//
//  RegistrationViewCotroller.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

class RegistrationViewCotroller: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var name : UITextField!
    @IBOutlet weak var email : UITextField!
    @IBOutlet weak var mobile : UITextField!
    @IBOutlet weak var gender : UITextField!
    @IBOutlet weak var password : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func checkForEmpty() -> Bool {
        return false
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        if !self.checkForEmpty(){
           let success = AppConstants.shared.register(name: self.name.text!, email: self.email.text!, mobile: self.mobile.text!, gender: self.gender.text!, password: self.password.text!)
            if success {
                (self.navigationController as! AppNavigationControllerViewController).gotoSavedLogin()
            } else {
                self.showAlert(message: "Registration unsuccesful")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}
