//
//  AuthService.swift
//  TwitterTutorial
//
//  Created by justin on 2022/12/2.
//

import Foundation
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}


struct AuthServic {
    static let shared = AuthServic()

    func logerUserIn(withEmail email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        print("DEBUG: Email is \(email), password is \(password)")
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }

    func registerUser(credentials: AuthCredentials, completion: @escaping (Error?, DatabaseReference) -> Void) {
        let email = credentials.email
        let password = credentials.password
        let fullname = credentials.fullname
        let username = credentials.username
        let profileImage = credentials.profileImage

        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        storageRef.putData(imageData) { (meta, error) in
            storageRef.downloadURL { url, error in
                if let error {
                    print("DEBUG: Failed to upload image \(error.localizedDescription)")
                }

                guard let profileImageUrl = url?.absoluteString else { return }

                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error {
                        print("DEGUG: Error is \(error.localizedDescription)")
                        return
                    }

                    print("DEBUG: Successfully create user")

                    guard let uid = result?.user.uid else { return }

                    let values = ["email": email,
                                  "username": username,
                                  "fullname": fullname,
                                  "profileImageUrl": profileImageUrl
                    ]

                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                    
                }
            }
        }
    }
}
