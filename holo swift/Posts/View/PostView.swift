import SwiftUI

struct PostView: View {

    let post: Post
    
    var body: some View {
        VStack(spacing: 16) {
            
            // images
            PostImageCourouselView(post: post)
                .frame(height: 490)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .tabViewStyle(.page)
            
            // post details
            HStack {
                // details
                VStack(alignment: .leading) {
                    Text("\(post.UserName)")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text("\(post.Comment)")
                        .foregroundColor(.white)
                        
                    HStack(spacing: 4) {
                        Text("View all \(post.CommentInt) comments")
                            .foregroundStyle(.gray)
                          
                    }
                }
                
                Spacer(minLength: 0)
                
                // likes
                HStack(spacing: 4) { // Adjust the spacing here
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                    
                    Text("\(post.Likes)")
                        .foregroundColor(.white)
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    PostView(post: DeveloperPreview.shared.posts[0])
}

