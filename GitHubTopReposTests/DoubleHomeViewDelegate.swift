//
//  DoubleHomeViewDelegate.swift
//  GitHubTopReposTests
//
//  Created by Gabriel Santiago on 30/05/23.
//

import Foundation
@testable import GitHubTopRepos


class DoubleHomeViewDelegate: HomeViewDelegate {

    var labelTextParam: String? = nil


    func update() {
        labelTextParam = "changed"
    }
}
