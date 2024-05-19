//
//  Post.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    let UserId: String
    let UserName: String
    let Comment: String
    let imageURLs: [String]
    let Likes: Int
    let CommentInt:Int
    
}


