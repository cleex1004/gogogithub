//
//  RepoDetailViewController.swift
//  gogogithub
//
//  Created by Christina Lee on 4/5/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit
import SafariServices

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoViewController.identifier {
            segue.destination.transitioningDelegate = self
            
        }
    }
    
    func presentSafariViewControllerWith(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let safariController = SFSafariViewController(url: url)
        self.present(safariController, animated: true, completion: nil)
    }
    
    func presentWebViewControllerWith(urlString: String) {
        let webController = WebViewController()
        webController.url = urlString
        
        self.present(webController, animated: true, completion: nil)
    }
    
    @IBAction func moreDetailsButton(_ sender: UIButton) {
        guard let repo = repo else { return }
        
        presentSafariViewControllerWith(urlString: repo.repoUrlString!)
        
//        presentWebViewControllerWith(urlString: repo.repoUrlString!)
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

