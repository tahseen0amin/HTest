//
//  SplashViewController.swift
//  HTEST_SUNDAY
//
//  Created by Taseen Amin on 04/12/2016.
//  Copyright © 2016 Taazuh. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SkipToLogin(_ sender: Any) {
        (self.navigationController as! AppNavigationControllerViewController).enterLoginScreen()
    }

}
