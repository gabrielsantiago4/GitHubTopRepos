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
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var configButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.delegate = self
        viewModel.getRepositoriesData(language: "Swift")
    }

    @IBAction func configButtonAction(_ sender: Any) {
        print("apertou")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reposList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = viewModel.reposList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        API().getUser(url: repo.owner.url) { gitUser in
            DispatchQueue.main.async {
                cell.ownerFullname.text = gitUser.name
            }
        }
        cell.configureCell(with: repo)
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



