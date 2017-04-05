//
//  RepoViewController.swift
//  gogogithub
//
//  Created by Christina Lee on 4/4/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDataSource {
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
        self.searchBar.delegate = self
        update()
    }
    
    func update() {
        print("update repo controller here!")
        Github.shared.getRepos { (repositories) in
            print("in updates")
            for repo in repositories! {
                self.allRepos.append(repo)
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayRepos?.count ?? allRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        let currentRepo = allRepos[indexPath.row]
        
        cell.textLabel?.text = displayRepos?[indexPath.row].name ?? currentRepo.name
        cell.detailTextLabel?.text = displayRepos?[indexPath.row].description ?? currentRepo.description
        
        return cell
    }
    
}

extension RepoViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
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

