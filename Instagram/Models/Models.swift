//
//  Models.swift
//  Instagram
//
//  Created by kms on 2021/08/08.
//

import Foundation

enum Gender {
    case male, female, other
}

struct UserCount {
    let followers: Int
    let following: Int
    let posts: Int
    
}

struct User {
    let username: String
    let bio: String
    let name:(first: String, last: String)
    let profilePhoto: URL
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

public enum UserPostType: String {
    case photo = "Photo"
    case video = "Video"
}

///Represents a user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumnailImage: URL  //
    let postURL : URL // either video url or full resolution photo
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createDate: Date
    let taggedUsers: [String]
    let owner: User
}

struct PostLike{
    let username: String
    let postIdentifier: String
}

struct PostComment{
    let identifier: String
    let username: String
    let text: String
    let createDae: Date
    let likes: [CommentLike]
}

struct CommentLike {
    let username: String
    let commentIdentifier: String
}
