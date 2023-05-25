//
//  ViewController.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 24/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    var repos: [Repository] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        API().getTopRatedRepos { repos in
            self.repos = repos.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var repo = repos[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.repositoryName.text = repo.name
        cell.repositoryDescription.text = repo.description
        cell.ownerUsername.text = repo.owner.login
        cell.ownerProfilePicture.layer.cornerRadius = cell.ownerProfilePicture.frame.size.height / 1.94
        cell.ownerProfilePicture.layer.masksToBounds = true
        return cell
    }
}

