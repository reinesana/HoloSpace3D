import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab)
        {
            ExploreView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill: .none)
                }
                .padding(.top, 8) // Add padding to move the logo down
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ContentView()
                .tabItem {
                    Image(systemName: selectedTab == 1 ? "plus.fill" : "plus")
                        .environment(\.symbolVariants, selectedTab == 1 ? .fill: .none)
                }
                .padding(.top, 8) // Add padding to move the logo down
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            UserView()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill: .none)
                }
                .padding(.top, 8) // Add padding to move the logo down
                .onAppear { selectedTab = 2 }
                .tag(2)
        }
        .tint(.purple)
       
    }
}

#Preview {
    MainTabView()
}
