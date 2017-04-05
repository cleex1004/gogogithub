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
//        print("complete this for lab")
//        print(json)
        if let name = json["name"] as? String, let description = json["description"] as? String, let language = json["language"] as? String {
            self.name = name
            self.description = description
            self.language = language
        } else {
            return nil
        }
        
    }
}
