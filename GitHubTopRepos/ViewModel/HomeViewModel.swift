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

    func getRemoteData() {
        API().getTopRatedRepos { repos in
            self.reposList = repos.items
        }
    }

}
