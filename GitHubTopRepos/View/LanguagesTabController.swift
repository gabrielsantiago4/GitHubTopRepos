//
//  LanguagesTabController.swift
//  GitHubTopRepos
//
//  Created by Gabriel Santiago on 30/05/23.
//

import UIKit

class LanguagesTabController: UIViewController {

    var delegate: languagesTabDelegate?

    @IBOutlet weak var javaButton: UIButton!
    @IBOutlet weak var kotlinButton: UIButton!
    @IBOutlet weak var swiftButton: UIButton!
    @IBOutlet weak var cplusButton: UIButton!
    @IBOutlet weak var pythonButton: UIButton!
    @IBOutlet weak var rubyButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.90)
    }

    @IBAction func javaButtonAction(_ sender: Any) {
        delegate?.changeDisplayedLanguage(to: "Java")
    }
    @IBAction func kotlinButtonAction(_ sender: Any) {
        delegate?.changeDisplayedLanguage(to: "Kotlin")
    }
    @IBAction func swiftButtonAction(_ sender: Any) {
        delegate?.changeDisplayedLanguage(to: "Swift")
    }
    @IBAction func cplusButtonAction(_ sender: Any) {
        delegate?.changeDisplayedLanguage(to: "C++")
    }
    @IBAction func pythonButtonAction(_ sender: Any) {
        delegate?.changeDisplayedLanguage(to: "Python")
    }
    @IBAction func rubyButtonAction(_ sender: Any) {
        delegate?.changeDisplayedLanguage(to: "Ruby")
    }



}
