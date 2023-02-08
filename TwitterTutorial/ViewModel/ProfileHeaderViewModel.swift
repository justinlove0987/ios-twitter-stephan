//
//  ProfileHeaderViewModel.swift
//  TwitterTutorial
//
//  Created by justin on 2023/1/6.
//

import UIKit
import Firebase

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes

    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct ProfileHeaderViewModel {

    private let user: User

    let usernameText: String

    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: "followers")
    }

    var followingString: NSAttributedString? {
        return attributedText(withValue: 2, text: "following")
    }

    var actionButtonTitle: String {
        // if user is  current user then set to eidt profile
        // else figure out following/not following
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return "Follow"
        }

    }

    init(user: User) {
        self.user = user
        self.usernameText = "@" + user.username
    }

    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])

        attributedTitle.append(NSAttributedString(string: " \(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))

        return attributedTitle
    }
}
