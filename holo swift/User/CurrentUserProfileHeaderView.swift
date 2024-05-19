//
//  CurrentUserProfileHeaderView.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-19.
//

import SwiftUI

struct CurrentUserProfileHeaderView: View {
    
    var body: some View {
        VStack(spacing: 10) { // Adjust the spacing if needed
            ZStack {
                Image("prof-1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                
                Image(systemName: "circle.fill")
                    .imageScale(.small)
                    .foregroundStyle(.green)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .offset(x: 50, y: -40)
            }
            
            Text("Master Oogway")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, 5) // Move the text closer to the image if needed
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200) // Adjust the frame height to move everything up
        .padding(.top, -20) // Adjust the padding to move the entire VStack higher
    }
}

#Preview {
    CurrentUserProfileHeaderView()
}

