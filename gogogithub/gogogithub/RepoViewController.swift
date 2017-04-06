//
//  RepoViewController.swift
//  gogogithub
//
//  Created by Christina Lee on 4/4/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController {
    var allRepos = [Repository]() {
        didSet {
            self.repoTableView.reloadData()
        }
    }
    
    var displayRepos : [Repository]? {
        didSet {
            self.repoTableView.reloadData()
        }
    }
    
    @IBOutlet weak var repoTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.repoTableView.dataSource = self
        self.repoTableView.delegate = self
        self.searchBar.delegate = self
        update()
        
        let repoNib = UINib(nibName: "RepositoryCell", bundle: nil)
        self.repoTableView.register(repoNib, forCellReuseIdentifier: RepositoryCell.identifier)
        self.repoTableView.estimatedRowHeight = 50
        self.repoTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func update() {
        Github.shared.getRepos { (repositories) in
            for repo in repositories! {
                self.allRepos.append(repo)
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == RepoDetailViewController.identifier {
            if let selectedIndex = self.repoTableView.indexPathForSelectedRow?.row{
                var selectedRepo : Repository
                if searchBar.text == "" {
                    selectedRepo = allRepos[selectedIndex]
                } else {
                    selectedRepo = displayRepos![selectedIndex]
                }

                guard let destinationController = segue.destination as? RepoDetailViewController else { return }
                destinationController.repo = selectedRepo
            }
            segue.destination.transitioningDelegate = self
            
        }
    }
    
}

//MARK: UIViewControllerTransitioningDelegate
extension RepoViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let customTransition = CustomTransition(duration: 1.0)
        
        return customTransition
    }
}

//MARK: UITableViewDataSource UITableViewDelegate
extension RepoViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayRepos?.count ?? allRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTableView.dequeueReusableCell(withIdentifier: RepositoryCell.identifier, for: indexPath) as! RepositoryCell
        var currentRepo : Repository
        if searchBar.text == "" {
            currentRepo = allRepos[indexPath.row]
        } else {
            currentRepo = displayRepos![indexPath.row]
        }
        cell.repository = currentRepo
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: RepoDetailViewController.identifier, sender: nil)
    }
}

//MARK: UISearchBarDelegate
extension RepoViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.validate() {
            print(searchText)
            //searchBar.text = "Invalid!"
            let lastIndex = searchText.index(before: searchText.endIndex)
        }
        
        if let searchedText = searchBar.text {
            self.displayRepos = self.allRepos.filter({$0.name.contains(searchedText)})
        }
        
        if searchBar.text == "" {
            self.displayRepos = nil
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.displayRepos = nil
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder() //dismisses keyboard
    }
}


