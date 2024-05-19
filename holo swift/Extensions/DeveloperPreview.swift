//
//  DeveloperPreview.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    var posts: [Post] = [
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "morganacat",
            Comment: "Cramming for exams.. ",
            imageURLs: ["table-2", "table-3", "table-1"],
            Likes: 253,
            CommentInt: 129
      
        ),
        
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "cys2002",
            Comment: "an icon",
            imageURLs: ["terry-1", "terry-2", "terry-3"],
            Likes: 492,
            CommentInt: 54
        ),
        
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "bobalover150",
            Comment: "we got boba after this",
            imageURLs: ["girls-1", "girls-2", "girls-3"],
            Likes: 395,
            CommentInt: 60
        ),
        
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "gru10122",
            Comment: "team of the year",
            imageURLs: ["group-1", "group-2", "group-3"],
            Likes: 125,
            CommentInt: 24
        )
        
    
    
    
    ]
}
