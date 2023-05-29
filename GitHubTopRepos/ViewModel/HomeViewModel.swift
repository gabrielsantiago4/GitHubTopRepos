//
//  HomeViewModel.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 25/05/23.
//

import Foundation


class HomeViewModel {

    weak var delegate: HomeViewDelegate?

    var reposList: [Repository] = [] {
        didSet {
            delegate?.update()
        }
    }

    func getRepositoriesData(language: String) {
        API().getTopRatedRepos(language: language) { repos in
            self.reposList = repos.items
        }
    }
}
