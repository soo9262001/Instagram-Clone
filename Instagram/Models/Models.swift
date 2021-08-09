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
    let joinDate: Date
}

struct User {
    let username: String
    let bio: String
    let name:(first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
}

public enum UserPostType {
    case photo, video
}

///Represents a user post
public struct UserPost {
    let identifier: String
    let postType: UserPostType
    let thumnailImage: URL  //
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComment]
    let createDate: Date
    let taggedUsers: [String]
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
