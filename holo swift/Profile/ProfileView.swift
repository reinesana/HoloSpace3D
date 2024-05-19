//
//  ProfileView.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-18.
//

import SwiftUI

struct ProfileView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Holospace")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Log in to start posting in 3D")
                }
                
                if isLoggedIn {
                    NavigationLink(destination: MainTabView()) {
                        Text("Begin")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 280, height: 48)
                            .background(Color.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                } else {
                    Button(action: {
                        // Perform login
                        isLoggedIn = true
                    }) {
                        Text("Log in")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 280, height: 48)
                            .background(Color.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
    
                    }
                }
            }
            .padding()
            
        }
    }
}
