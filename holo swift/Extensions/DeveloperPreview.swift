//
//  DeveloperPreview.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import Foundation

// Example developer preview data
struct DeveloperPreview {
    static let shared = DeveloperPreview()
    
    var posts: [Post] = [
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "morganacat",
            Comment: "terry fox at sfu",
            imageURLs: "file:///Users/reinesana/Downloads/terry_fox_3d.gif",
            isGIF: true,
            Likes: 253,
            CommentInt: 129
      
        ),
        
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "cys2002",
            Comment: "cramming for exams",
            imageURLs: "file:///Users/reinesana/Downloads/Screen%20Recording%202024-05-19%20at%2011.05.05%E2%80%AFAM.gif",
            isGIF: true,
            Likes: 492,
            CommentInt: 54
        ),
        
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "gru10122",
            Comment: "after hours at sfu",
            imageURLs: "file:///Users/reinesana/Downloads/Screen%20Recording%202024-05-19%20at%2010.21.25%E2%80%AFAM.gif",
            isGIF: true,
            Likes: 125,
            CommentInt: 24
        ),
        
        .init(
            id: NSUUID().uuidString,
            UserId: NSUUID().uuidString,
            UserName: "bobalover150",
            Comment: "we got boba after this",
            imageURLs: "file:///Users/reinesana/Downloads/girls%20(1).gif",
            isGIF: true,
            Likes: 395,
            CommentInt: 60
            
        )
        
    
    
    
    ]
}
