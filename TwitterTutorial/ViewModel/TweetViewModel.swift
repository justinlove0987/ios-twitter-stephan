//
//  TweetViewModel.swift
//  TwitterTutorial
//
//  Created by justin on 2023/1/4.
//

import UIKit

struct TweetViewModel {

    let tweet: Tweet
    let user: User

    var profileImageUrl: URL? {
        return tweet.user.profileImageUrl
    }

    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? ""
    }

    var usernameTet: String {
        return "@\(user.username)"
    }

    var headerTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a・MM/dd/yyyy"
        return formatter.string(from: tweet.timestamp)
    }

    var retweetAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.retweetCount, text: "Retweets")
    }

    var likesAttributedString: NSAttributedString? {
        return attributedText(withValue: tweet.likes, text: "Likes")
    }

    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname,
                                              attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])

        title.append(NSAttributedString(string: " @\(user.username)",
                                        attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                                            .foregroundColor: UIColor.lightGray]))

        title.append(NSAttributedString(string: "・\(timestamp)",
                                        attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                                                     .foregroundColor: UIColor.lightGray]))

        return title
    }

    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }

    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])

        attributedTitle.append(NSAttributedString(string: " \(text)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))

        return attributedTitle
    }

    func size(forWith width: CGFloat) -> CGSize {
        let mesurementLabel = UILabel()
        mesurementLabel.text = tweet.caption
        mesurementLabel.numberOfLines = 0
        mesurementLabel.lineBreakMode = .byWordWrapping
        mesurementLabel.translatesAutoresizingMaskIntoConstraints = false
        mesurementLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
        return mesurementLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
