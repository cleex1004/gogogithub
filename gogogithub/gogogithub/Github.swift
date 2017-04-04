//
//  Github.swift
//  gogogithub
//
//  Created by Christina Lee on 4/3/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

let kOAuthBaseURLString = "https://github.com/login/oauth/"

enum GitHubAuthError : Error {
    case extractingCode
}

enum SaveOptions {
    case userDefaults
}

typealias GitHubOAuthCompletion = (Bool) -> ()

class Github {
    
    let githubClientID = kgithubClientID
    let gitHubClientSecret = kgitHubClientSecret
    
    static let shared = Github()
    
    func oAuthRequestWith(parameters: [String : String]) {
        var parametersString = ""
        
        for (key, value) in parameters {
            parametersString += "&\(key)=\(value)"
        }
        
        print("parameter string: \(parametersString)")
        
        if let requestURL = URL(string: "\(kOAuthBaseURLString)authorize?client_id=\(githubClientID)\(parametersString)") {
            
            print(requestURL.absoluteString)
            
            UIApplication.shared.open(requestURL)
        }
    }
    
    func getCodeFrom(url: URL) throws -> String {
        guard let code = url.absoluteString.components(separatedBy: "=").last else {
            throw GitHubAuthError.extractingCode
        }
        
        return code
    }
    
    func tokenRequestFor(url: URL, saveOptions: SaveOptions, completion: @escaping GitHubOAuthCompletion) {
        
        func complete(success: Bool) {
            OperationQueue.main.addOperation {
                completion(success)
            }
        }
        do {
            let code = try self.getCodeFrom(url: url)
            let requestString = "\(kOAuthBaseURLString)access_token?client_id=\(githubClientID)&client_secret=\(gitHubClientSecret)&code=\(code)"
            
            if let requestURL = URL(string: requestString) {
                let session = URLSession(configuration: .default)
                session.dataTask(with: requestURL, completionHandler: { (data, response, error) in
                    if error != nil { complete(success: false) }
                    
                    guard let data = data else { complete(success: false); return }
                    
                    if let dataString = String(data: data, encoding: .utf8) {
                        print(dataString)
                        
                        complete(success: true)
                    }
                    
                }).resume()
            }
        } catch {
            print(error)
            complete(success: false)
        }
        
    }
}













