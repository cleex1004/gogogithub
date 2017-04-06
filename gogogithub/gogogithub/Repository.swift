//
//  Repository.swift
//  gogogithub
//
//  Created by Christina Lee on 4/4/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import Foundation

class Repository {
    let name : String
    let description : String?
    let language : String?
    var stars : Int?
    let isFork : Bool?
    let createdAt : String?
    let repoUrlString : String?
    
    init?(json: [String: Any]) {
        if let name = json["name"] as? String {
            self.name = name
        } else {
            return nil
        }
        if let description = json["description"] as? String {
            self.description = description
        } else {
            return nil
        }
        if let language = json["language"] as? String {
            self.language = language
        } else {
            return nil
        }
        if let stars = json["stargazers_count"] as? Int {
            self.stars = stars
        } else {
            return nil
        }
        if let isFork = json["fork"] as? Bool {
            self.isFork = isFork
        } else {
            return nil
        }
        if let createdAt = json["created_at"] as? String {
//            let dateFormatter = ISO8601DateFormatter()
//            let dateType = dateFormatter.date(from: createdAt)
//            let dateString = dateFormatter.string(from: dateType!)
//            self.createdAt = dateString
            let date = createdAt.components(separatedBy: "T").first?.components(separatedBy: "-")
            self.createdAt = "\(date![1])-\(date![2])-\(date![0])"
            
        } else {
            return nil
        }
        if let repoUrlString = json["html_url"] as? String { //ask how to get defaul with nil coalescing here
            self.repoUrlString = repoUrlString 
        } else {
            return nil
        }
        
    }
}
