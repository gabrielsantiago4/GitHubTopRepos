//
//  API.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 24/05/23.
//

import Foundation


struct API {

    func getTopRatedRepos(language: String, completion: @escaping (TopRatedReposList) -> Void) {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:\(language)&sort=stars&page=1") else {
            return
        }

        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let requestedData = data else {
                return
            }
            do {
                let repos = try JSONDecoder().decode(TopRatedReposList.self, from: requestedData)
                completion(repos)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }

    func getUser (url: String, completion: @escaping (GitUser) -> Void) {
        guard let url = URL(string: url) else {
            return
        }

        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let requestedData = data else {
                return
            }
            do {
                let gitUser = try JSONDecoder().decode(GitUser.self, from: requestedData)
                completion(gitUser)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
