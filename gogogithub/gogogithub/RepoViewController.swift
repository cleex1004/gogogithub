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
    
    @IBOutlet weak var repoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.repoTableView.dataSource = self
        update()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//    }
    func update() {
        print("update repo controller here!")
        Github.shared.getRepos { (repositories) in
            print("in updates")
            for repo in repositories! {
                self.allRepos.append(repo)
            }
            //                self.allRepos = repositories ?? []
            //                self.repoTableView.reloadData()
            
            
            //print(repositories?.first)
            //update tableView
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = repoTableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath)
        let currentRepo = allRepos[indexPath.row]
        
        cell.textLabel?.text = currentRepo.name
        cell.detailTextLabel?.text = currentRepo.description
        
        return cell
    }
    
}

