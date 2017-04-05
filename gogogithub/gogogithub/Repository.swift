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
        
    }
}
