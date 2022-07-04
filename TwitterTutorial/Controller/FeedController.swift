//
//  FeedController.swift
//  TwitterTutorial
//
//  Created by justin on 2022/7/4.
//

import UIKit

class FeedController: UITabBarController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configuerUI()

    }

    // MARK: - Helpers

    func configuerUI() {
        view.backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }

}
