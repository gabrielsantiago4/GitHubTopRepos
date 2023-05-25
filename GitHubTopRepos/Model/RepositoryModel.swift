//
//  RepositoryModel.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 24/05/23.
//

import Foundation


struct repository: Codable {
    var name: String
}

struct topRatedReposList: Codable {
    var items: [repository]
}

