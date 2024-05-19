//
//  UserView.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-19.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ZStack {
            Color.black // Set the background color to black
                .ignoresSafeArea() // Ensure the color covers the entire screen

            NavigationStack {
                ScrollView {
                    VStack(spacing: 4) {
                        // header view
                        CurrentUserProfileHeaderView()
                            .padding(.top, 20) // Adjust the padding to move the header view higher
                        
                        // account info
                        VStack(alignment: .center, spacing: 2) {
                            Text("@oogway")
                                .foregroundColor(.gray)
                                .fontWeight(.light)
                            
                            HStack(spacing: 2) {
                                Text("the one and only")
                                    .foregroundStyle(.gray)
                            }
                        }
                        .padding(.top, -20) // Adjust the padding if you want some space below the header view
                        
                        Spacer() // Pushes the content to the top
                        
                        VStack(alignment: .trailing, spacing: 0) {
                            Text("Holo Posts")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                        }
                        .padding(.top, 20)
                        
                        // LazyVGrid content
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(0..<6) { index in
                                Image("post-\(index + 1)") // Assuming you have images named "photo-1", "photo-2", etc.
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110, height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 17))
                            }
                        }
                        .padding()
                        .frame(height: 500)
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(10.6)]), startPoint: .top, endPoint: .bottom)
                        .background(
                            Image("hero-image") // Replace "your_overlay_image" with the name of your overlay image asset
                                .resizable()
                                .scaledToFill()
                                .ignoresSafeArea()
                        )
                )
            }
        }
        
    }

    private var columns: [GridItem] {
        [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    }
}

#Preview {
    UserView()
}

