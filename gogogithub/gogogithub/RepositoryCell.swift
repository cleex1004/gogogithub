//
//  RepositoryCell.swift
//  gogogithub
//
//  Created by Christina Lee on 4/5/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var repository : Repository! {
        didSet {
            self.nameLabel.text = repository.name
            self.languageLabel.text = repository.language ?? "Unknown Language"
            self.descriptionLabel.text = repository.description
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}
