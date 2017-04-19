//
//  UIExtensions.swift
//  gogogithub
//
//  Created by Christina Lee on 4/4/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit


extension UIResponder {
    static var identifier : String {
        return String(describing: self)
    }
}
