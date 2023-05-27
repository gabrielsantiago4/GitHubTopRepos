//
//  RepositoryModel.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 24/05/23.
//

import Foundation


struct Repository: Codable {
    var name: String
    var description: String
    var owner: owner
    var stargazers_count: Int
    var forks_count: Int
}

struct TopRatedReposList: Codable {
    var items: [Repository]
}

struct owner: Codable {
    var login: String
}

