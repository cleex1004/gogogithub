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
        self.dateLabel.text = self.repo.createdAt
        self.languageLabel.text = self.repo.language
        self.starsLabel.text = "Number of stars: \(String(describing: self.repo.stars!))"
        self.forkLabel.text = "This is a fork: \(String(describing: self.repo.isFork!))"
        self.descriptionLabel.text = self.repo.description
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoViewController.identifier {
            segue.destination.transitioningDelegate = self
            
        }
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: RepoViewController.identifier, sender: nil)
    }
    
//    @IBAction func goBackButtonPressed(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
    
}

//MARK: UIViewControllerTransitioningDelegate
extension RepoDetailViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let customTransition = CustomTransition(duration: 1.0)
        
        return customTransition
    }
    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        let customTransition = CustomTransition(duration: 1.0)
//        
//        return customTransition
//    }
}

