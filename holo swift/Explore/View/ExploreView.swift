import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Explore")
                    .fontWeight(.bold)
                    .font(.title) // Adding a font size for better visual hierarchy
                    .padding(.top, 15) // Adding padding to the top to separate from navigation bar

                ScrollView {
                    VStack(spacing: 0) {
                        StoryListView()
                            .padding(.bottom, 10) // Adding padding to separate from LazyVStack

                        LazyVStack(spacing: 0) {
                            ForEach(viewModel.posts) { post in
                                PostView(post: post)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.horizontal, 10) // Adjust padding here
                                    .padding(.vertical, 5) // Adding vertical padding for better spacing
                            }
                        }
                    }
                }
                .padding(.horizontal, 0) // Adjust horizontal padding of the VStack
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Image(systemName: "pencil.and.outline"),
                trailing: Image(systemName: "bell.badge.fill")
            )
            .background(Color.black)
            .foregroundColor(.white)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}

