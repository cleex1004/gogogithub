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
            self.createdAt = createdAt
        } else {
            return nil
        }
        
    }
}
