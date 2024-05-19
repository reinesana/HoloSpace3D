//
//  PostImageCourouselView.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import SwiftUI

struct PostImageCourouselView: View {
    let post: Post
    
    var body: some View {
        TabView {
            ForEach(post.imageURLs, id: \.self) { image in Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    PostImageCourouselView(post: DeveloperPreview.shared.posts[0])
}
