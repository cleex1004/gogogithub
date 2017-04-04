//
//  GitHubAuthController.swift
//  gogogithub
//
//  Created by Christina Lee on 4/3/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class GitHubAuthController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (UserDefaults.standard.getAccessToken() != nil) {
            loginButton.isHidden = true
        }
        

  
    }

    @IBAction func printTokenPressed(_ sender: Any) {
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let parameters = ["scope" : "email,user"]
        Github.shared.oAuthRequestWith(parameters: parameters)
    }
}
