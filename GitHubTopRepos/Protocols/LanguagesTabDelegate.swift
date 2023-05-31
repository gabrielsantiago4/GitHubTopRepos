//
//  LanguagesTabDelegate.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 30/05/23.
//

import Foundation

protocol LanguagesTabDelegate: AnyObject {
    func changeDisplayedLanguage(to language: String)
}
