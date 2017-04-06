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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (UserDefaults.standard.string(forKey: "access_token") != nil) {
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (UserDefaults.standard.string(forKey: "access_token") != nil) {
            self.loginButton.isEnabled = false
        } else {
            self.loginButton.isEnabled = true
        }
    }

    @IBAction func printTokenPressed(_ sender: Any) {
        let token = UserDefaults.standard.getAccessToken()
        print(token as Any)
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let parameters = ["scope" : "email,user,repo"]
        Github.shared.oAuthRequestWith(parameters: parameters)
    }
    
    func dismissAuthController() {
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
}
