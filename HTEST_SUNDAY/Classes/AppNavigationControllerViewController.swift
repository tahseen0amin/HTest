//
//  AppNavigationControllerViewController.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

class AppNavigationControllerViewController: UINavigationController {
    
    let MainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    func enterSplashScreen(){
        let controller = self.MainStoryboard.instantiateViewController(withIdentifier: "SPLASH") as? SplashViewController
        if self.topViewController is SplashViewController{
            return
        }
        if controller != nil {
            self.viewControllers = [controller!]
        }
        
    }
    
    func enterLoginScreen(){
        let controller = self.MainStoryboard.instantiateViewController(withIdentifier: "LOGIN") as? LoginViewController
        if controller != nil {
            self.viewControllers = [controller!]
        }
    }
    
    func gotoRegistrationScreen(){
        let controller = RegistrationViewCotroller()
        self.pushViewController(controller, animated: true)
    }
    func gotoSavedLogin(){
        let controller = SavedAccountListViewController()
        self.pushViewController(controller, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show splash once
        if UserDefaults.standard.bool(forKey: FIRST_LAUNCH_DONE) == false {
            self.enterSplashScreen()
            UserDefaults.standard.set(true, forKey: FIRST_LAUNCH_DONE)
            UserDefaults.standard.synchronize()
        } else {
            self.enterLoginScreen()
            // go to login
            
        }
        
    }

    
}
