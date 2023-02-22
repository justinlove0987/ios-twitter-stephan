//
//  ActionSheetLauncher.swift
//  TwitterTutorial
//
//  Created by justin on 2023/2/22.
//

import Foundation

class ActionSheetLauncher: NSObject {

    // MARK: - Properties

    private let user: User

    init(user: User) {
        self.user = user
        super.init()
    }

    // MARK: - Helpers

    func show() {
        print("foo - \(user.username)")
    }
}
