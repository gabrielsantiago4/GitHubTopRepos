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
    @IBOutlet weak var forksCount: UILabel!
    @IBOutlet weak var starsCount: UILabel!


    func configureCell(with repository: Repository) {
        self.repositoryName.text = repository.name
        self.repositoryDescription.text = repository.description
        self.ownerUsername.text = repository.owner.login
        self.ownerProfilePicture.loadRemoteImage(url: repository.owner.avatar_url)
        self.forksCount.text = "\(repository.forks_count)"
        self.starsCount.text = "\(repository.stargazers_count)"
    }

}
