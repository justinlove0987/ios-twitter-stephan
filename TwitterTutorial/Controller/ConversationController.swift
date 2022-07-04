//
//  ConversationController.swift
//  TwitterTutorial
//
//  Created by justin on 2022/7/4.
//

import UIKit

class ConversationController: UITabBarController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configuerUI()
    }

    // MARK: - Helpers

    func configuerUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }

}

