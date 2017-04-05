//
//  RepoDetailViewController.swift
//  gogogithub
//
//  Created by Christina Lee on 4/5/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class RepoDetailViewController: UIViewController {
    
    var repo : Repository!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var starsLabel: UILabel!
    
    @IBOutlet weak var forkLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLabel.text = self.repo.name
        //self.dateLabel.text = DateFormatter.localizedString(from: self.repo.createdAt!, dateStyle: .short, timeStyle: .short)
        self.dateLabel.text = self.repo.createdAt
        self.languageLabel.text = self.repo.language
        self.starsLabel.text = "Number of stars: \(String(describing: self.repo.stars!))"
        self.forkLabel.text = "This is a fork: \(String(describing: self.repo.isFork!))"
        self.descriptionLabel.text = self.repo.description
    }
}

