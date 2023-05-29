//
//  ViewController.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 24/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel = HomeViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        viewModel.getRemoteData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reposList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = viewModel.reposList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.repositoryName.text = repo.name
        cell.repositoryDescription.text = repo.description
        cell.ownerUsername.text = repo.owner.login
        cell.ownerProfilePicture.loadRemoteImage(url: repo.owner.avatar_url)
        cell.forksCount.text = "\(repo.forks_count)"
        cell.starsCount.text = "\(repo.stargazers_count)"
        return cell
    }
}

extension HomeViewController: HomeViewDelegate {
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}



