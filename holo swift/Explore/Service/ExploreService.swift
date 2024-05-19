//
//  ExploreService.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import Foundation

class ExploreService {
    func fetchPosts() async throws -> [Post] {
        return DeveloperPreview.shared.posts
    }
}
