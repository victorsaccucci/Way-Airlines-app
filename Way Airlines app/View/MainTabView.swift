import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            AirplanesView()
                .tabItem {
                    Label("Aviões", systemImage: "airplane")
                }
        }
        .accentColor(.blue)
    }
}


#Preview {
    MainTabView()
}
