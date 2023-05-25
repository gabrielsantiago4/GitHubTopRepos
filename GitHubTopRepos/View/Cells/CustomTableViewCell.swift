//
//  TableViewCell.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 25/05/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!
    @IBOutlet weak var ownerUsername: UILabel!
    @IBOutlet weak var ownerFullname: UILabel!
    @IBOutlet weak var ownerProfilePicture: UIImageView!
}
