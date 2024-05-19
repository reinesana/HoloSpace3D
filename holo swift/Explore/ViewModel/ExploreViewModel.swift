//
//  ExploreViewModel.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var posts = [Post]()
    private let service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchPosts() }
    }
    
    func fetchPosts() async {
        do {
            self.posts = try await service.fetchPosts()
        } catch {
            print("DEBUG: Failed to fetch posts with error: \(error.localizedDescription)")
        }
        
    }
    
}
