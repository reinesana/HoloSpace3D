//
//  UserHeading.swift
//  holo swift
//
//  Created by Shana Kesia Nursoo on 2024-05-20.
//


import SwiftUI

struct UserHeading: View {
    
    var body: some View {
        VStack { // Adjust the spacing if needed
            ZStack {
                Image("post-5")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 37, height: 37)
                    .clipShape(Circle())
                
                Text("reinesana")
                    .offset(x:70)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
            }
        
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50) // Adjust the frame height to move everything up
        .padding(.top, -20) 
  
        .frame(alignment: .leading)// Adjust the padding to move the entire VStack higher
    }
}

#Preview {
    UserHeading()
}


