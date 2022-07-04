//
//  MainTabController.swift
//  TwitterTutorial
//
//  Created by justin on 2022/7/4.
//

import UIKit

class MainTabController: UITabBarController {

    // MARK: - Properties

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        configureViewController()
    }

    // MARK: - Helpers

    func configureViewController() {
        let feed = FeedController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")

        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")

        let notifications = NotificationsController()
        notifications.tabBarItem.image = UIImage(named: "search_unselected")

        let conversation = ConversationController()
        conversation.tabBarItem.image = UIImage(named: "search_unselected")

        viewControllers = [feed, explore, notifications, conversation]
    }


}
